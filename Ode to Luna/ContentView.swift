//
//  ContentView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 13/06/21.
//

import SwiftUI

struct CustomText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new Custom Text")
        self.text = text
    }
}

struct ContentView: View {
    // List acts Lazily, creating views when needed while ScrollView creates all the items at once
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(1..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
