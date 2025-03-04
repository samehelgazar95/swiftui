//
//  notes.swift
//  3-ViewsAndModifiers
//
//  Created by Sameh ElGazar on 03/03/2025.
//

import Foundation

/**
 
- Views as properties: There 3 ways to create views as properties
 1- using @ViewBuilder: The best way to create views as properties
 @ViewBuilder var spells: some View {
    Text("Hello")
    Text("World")
 }

 2- return the view immediatly if it's only one view or return the views in a Stack if there are more than one view
 var motto1: some View {
     Text("Draco dormiens")
 }
 
 var spells: some View {
     VStack {
         Text("Lumos")
         Text("Obliviate")
     }
 }
  
 3- it's better to use Group instead of Stack
 var spells: some View {
        Group {
             Text("Hello")
             Text("World")
        }
 }
 
 - View composition: Splitting the components to small chunks and combine them togeather
 
 */



/**
 
 - Custom Modifiers
 
 import SwiftUI

 struct ContentView: View {
     var body: some View {

         VStack {
             Text("Hello World!")
                 .titleStyle()
                 .watermarked(with: "Logo")
         }

     }
 }

 // To create a custom modifier, create a new struct that conforms to the -ViewModifier- protocol. This has only one requirement, which is a -method- called -body- that accepts whatever content it’s being given to work with, and must return -some View-.

 struct Title: ViewModifier {
     func body(content: Content) -> some View {
         content
             .font(.largeTitle)
             .foregroundStyle(.white)
             .padding()
             .background(.blue)
     }
 }

 extension View {
     func titleStyle() -> some View {
         modifier(Title())
     }
 }

 // Custom Modifier that returns object with new value not just style

 struct watermark: ViewModifier {
     var text: String
     
     func body(content: Content) -> some View {
         ZStack(alignment: .bottomTrailing) {
             content
             
             Text(text)
                 .font(.caption)
                 .foregroundStyle(.white)
                 .padding(5)
                 .background(.black)
         }
     }
 }

 extension View {
     func watermarked(with text: String) -> some View {
         modifier(watermark(text: text))
     }
 }
 
 */
