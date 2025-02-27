//
//  ContentView.swift
//  WeSplit
//
//  Created by Sameh ElGazar on 17/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LengthConverter()
    }
}

struct LengthConverter : View {
    let lengths = ["meter", "km", "feet", "yard", "mile"]
    @State private var from: String = "meter"
    @State private var to: String = "meter"
    @State private var amount: Double = 0
    var result: Double {
        convert(value: amount, from: from, to: to)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("From") {
                    Picker("From", selection: $from) {
                        ForEach(lengths, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("To") {
                    Picker("To", selection: $to) {
                        ForEach(lengths, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Amount to convert") {
                    TextField("Amount to convert", value: $amount, format: .number)
                }
                
                Section("Result") {
                    Text("\(amount.formatted()) \(from)s = \(result.formatted()) \(to)s")
                }
            }
        }
    }

    func convert(value: Double, from: String, to: String) -> Double {
        let conversionRates: [String: Double] = [
            "meter": 1.0,
            "km": 1000.0,
            "feet": 0.3048,
            "yard": 0.9144,
            "mile": 1609.34
        ]
        
        if let fromRate = conversionRates[from], let toRate = conversionRates[to] {
            return (value * fromRate) / toRate
        }
        
        return 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

