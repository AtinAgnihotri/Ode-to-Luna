//
//  ContentView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 13/06/21.
//

import SwiftUI



struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    var body: some View {
        NavigationView {
            VStack {
                Button ("Decode JSON:  \(astronauts.count)") {
                    
                    }
                }.navigationBarTitle("SwiftUI")
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
