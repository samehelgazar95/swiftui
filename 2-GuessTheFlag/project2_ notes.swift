//
//  project2_ notes.swift
//  GuessTheFlag
//
//  Created by Sameh ElGazar on 27/02/2025.
//

import SwiftUI

/** Gradients
 
LinearGradient(stops: [
                    .init(color: .white, location: 0.33),
                    .init(color: .black, location: 0.66),
                    .init(color: .red, location: 0.99)
                ], startPoint: .top, endPoint: .bottom)

                LinearGradient(colors: [.white, .indigo], startPoint: .top, endPoint: .bottom)
              
                RadialGradient(colors: [.blue, .black], center: .center,
                               startRadius: 50, endRadius: 180)
              
                AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)

            Text("Your Content")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.indigo)
                .padding(50)
                .background(.red.gradient)
                .cornerRadius(20)
            }
 
 */

// // // // // // // // // // // // // // // // // // // //

/** Buttons
 
 VStack(spacing: 10) {

     Button("Button 1", action: exeuteDelete)
         .buttonStyle(.bordered)
     
     Button("Button 3", role: .destructive) {}
         .buttonStyle(.bordered)
     
     Button("Button 2") {}
         .buttonStyle(.borderedProminent)
     
     Button("Button 2", role: .destructive) {}
         .buttonStyle(.borderedProminent)
     
     Button("Button 4") {}
         .buttonStyle(.bordered)
         .tint(.mint)
     
     Button("Button 4") {}
         .buttonStyle(.borderedProminent)
         .tint(.mint)

     Button {
         print("Button was tapped!")
     } label: {
         Text("Tap me!")
             .padding()
             .foregroundColor(.white)
             .background(.red)
             .cornerRadius(.pi)
     }
     
     Button {
         print("pencil image")
     } label: {
         Image("pencil") // Will load the image that called pencil
     }
     
     Button {
         print("Will not read out loud in the reader")
     } label: {
         Image(decorative: "pencil")
     }
     
     Button {
         print("pencil icon from the system")
     } label: {
         Text("Edit")
         Image(systemName: "pencil")
     }
     .buttonStyle(.bordered)
     
     Button {
         print("Edit button was tapped")
     } label: {
         Label("Edit", systemImage: "pencil")
             .padding()
             .foregroundStyle(.white)
             .background(.red)
     }

 }
 
 */


// // // // // // // // // // // // // // // // // // // //

/** alerts
 
 @State private var showAlert: Bool = false
 
 var body: some View {
     
     VStack {
         Button("Show Alert") {
             showAlert = true
         }
         .alert("Important message", isPresented: $showAlert) {
             Button("Delete", role: .destructive) {}
             Button("Cancel", role: .cancel) {}
         } message: {
             Text("Please read this")
         }
     }
     
 }
 
 */
