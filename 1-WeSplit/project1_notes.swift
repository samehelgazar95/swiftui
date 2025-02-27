//
//  project 1
//

/* SwiftUI Concepts:
 
 Core Philosophy Comparison
    Declarative UI frameworks
    Component-based
    State-driven
 The View Tree and Rendering Model
    view identity system (Same as Reconciliation & diffing)
*/

/*
 
 - Text number values formatters like .currency & .percentage
 - pickerStyle(.navigationLink) prop must be in a NavigationStack
 - id: \.self >> tells the picker to use the value of the range or the array as value not index
    but if we removed it the picker will use the selection as index
 - @FocusState >> use it with the textField focus
 - Forms can scroll:
    Forms can indeed scroll, so it's a good idea to check your content doesn't overlap the system
    clock by accident.
 - The NavigationView view lets us show new views and also place text at the top of the screen.
 -
*/

/* 1- Stacks
        VStack {
            Image(systemName: "globe")
            .imageScale(.large)
            .foregroundColor(.accentColor)

            Text("Hello, world!")
                .foregroundColor(.red)
        }
        .padding()
        .border(.red.gradient)
*/

/* 2- Navigation
            NavigationStack {
                Form {
                    Section {
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                    }
                    Section {
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                    }
                    Section {
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                    }
                }
                .navigationTitle("Swift UI")
                .navigationBarTitleDisplayMode(.inline)
            }
*/


/* 3- two-way binding
 
struct ContentView: View {
    @State private var name: String = ""
    
    var body: some View {
        
        Form {
            TextField("Enter your name", text: $name)
            Text("Hello, \(name.lowercased().capitalized)")
                }
        
    }
}
*/


/* 4- ForEach, Picker,two-way binding
 
 struct ContentView: View {
     let students = ["Harry", "Hermione", "Ron"]
     @State private var selectedStudent = "Harry"

     var body: some View {

         NavigationStack {
             Form {
                 Picker("Select your student", selection: $selectedStudent) {
                     ForEach(students, id: \.self) {
                         Text($0)
                     }
                 }
             }
             .navigationTitle("Selected student")
             .navigationBarTitleDisplayMode(.inline)
         }

     }
 }
 */


/* Counter simple app
 
import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        Counter()
    }
}


struct CustomButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .foregroundColor(.white)
        }
        .background(Color.blue)
        .cornerRadius(8)  // First apply the corner radius
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.blue, lineWidth: 2)
        )  // Then add the border as an overlay with same corner radius
    }
}

struct Counter: View {
    @State private var counter: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(counter)")
                .font(.largeTitle)
                .padding()
            
            HStack(spacing: 20) {
                CustomButton(title: "Increase") {
                    counter += 1
                }
                
                CustomButton(title: "Decrease") {
                    counter -= 1
                }
            }
        }
    }
}
*/
