//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sameh ElGazar on 26/02/2025.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
        VStack(spacing: 30) {
            VStack {
                Text("Tap the flag of")
                    .foregroundStyle(.white)

                Text(countries[correctAnswer])
                    .foregroundStyle(.white)

            }
            
            ForEach(0..<3) { number in
                Button {
                    // flag was tapped
                } label: {
                    Image(countries[number])
                }
            }
        }
        
    }
}
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

