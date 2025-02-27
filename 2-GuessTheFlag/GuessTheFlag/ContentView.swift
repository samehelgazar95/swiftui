//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sameh ElGazar on 26/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore: Bool = false
    @State private var showingFinalScore: Bool = false
    @State private var scoreTitle: String = ""
    @State private var scoreMessage: String = ""
    @State private var totalScore: Int = 0
    @State private var question: Int = 0

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.5),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.5),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()

            VStack(spacing: 15) {
                Spacer()
                Spacer()

                VStack {
                    Text("Guess the Flag")
                        .font(.largeTitle.weight(.bold))
                        .foregroundStyle(.white)
                }

                Spacer()

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .resizable()
                                .frame(width: 230, height: 120)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .cornerRadius(50)

                Spacer()
                Spacer()

                VStack {
                    Text("Total score: \(totalScore) / 100")
                        .foregroundStyle(.white)
                        .font(.title.bold())
                    
                    Text("Question: \(question) / 10")
                        .foregroundStyle(.white)
                        .font(.title)
                }

                Spacer()
                Spacer()

            }
            .padding()

        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQ)
            Button("Reset", action: reset)
        } message: {
            Text(scoreMessage)
        }
        .alert("Game Over!", isPresented: $showingFinalScore) {
            Button("Play Again", action: reset)
        } message: {
            Text("Your final score is \(totalScore) / 10")
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            totalScore += 10
            scoreMessage = "Keep it up!"
        } else {
            scoreTitle = "Wrong"
            totalScore = max(0, totalScore - 10)
            scoreMessage = "That's the flag of \(countries[number])"
        }

        question += 1

        if question == 10 {
            showingFinalScore = true
        } else {
            showingScore = true
        }
    }

    func askQ() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        showingScore = false
        scoreTitle = ""
        scoreMessage = ""
        totalScore = 0
        question = 0
        askQ()
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

