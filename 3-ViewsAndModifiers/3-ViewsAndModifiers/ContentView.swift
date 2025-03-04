//
//  ContentView.swift
//  3-ViewsAndModifiers
//
//  Created by Sameh ElGazar on 02/03/2025.
//

import SwiftUI

struct ContentView: View {
    @ViewBuilder func starImage(row: Int) -> some View {
        Image(systemName: "star.fill")
            .foregroundColor(row % 2 == 0 ? .red : .yellow)
    }
    
    var body: some View {

        VStack {
            Text("Hello World!")
                .titleStyle()
                .watermarked(with: "Logo")

            GridStack(rows: 4, columns: 4) { row, col in
                HStack {
                    starImage(row: row)
                    Text("[\(row),\(col)]")
                }
                .frame(width: 70, height: 70)
                    
            }
        }

    }
}

// Custome Modifier: To create a custom modifier, create a new struct that conforms to the -ViewModifier- protocol. This has only one requirement, which is a -method- called -body- that accepts whatever content it’s being given to work with, and must return -some View-.

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

// Custom Grid Stack
struct GridStack<GenericContentType: View>: View {
    let rows: Int
    let columns: Int
    let contentFunc: (Int, Int) -> GenericContentType
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        contentFunc(row, column)
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
