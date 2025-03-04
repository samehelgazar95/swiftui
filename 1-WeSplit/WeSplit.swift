//
//  project1.swift
//  WeSplit
//
//  Created by Sameh ElGazar on 21/02/2025.
//

import SwiftUI

struct WeSplit: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 20
    @FocusState private var amountIsFocused: Bool
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let tipAmount: Double = checkAmount * Double(tipPercentage) / 100
        let grandTotal: Double = checkAmount + tipAmount
        let amountPerPerson = grandTotal / Double(numberOfPeople)
        
        return amountPerPerson
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                    //.pickerStyle(.navigationLink)
                }

                Section("how much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("total per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
//            .onTapGesture {
//                amountIsFocused = false
//            }
            //.navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
        }
    }
}



