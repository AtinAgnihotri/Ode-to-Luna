//
//  CreditsView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 14/06/21.
//

import SwiftUI

struct CreditsView: View {
    let nasaCredit = "The images of astronauts and mission badges by NASA, used under public domain license as per Title 17, Chapter 1, Section 105 of the US Code."
    let wikipediaCredit = "Credit for info on Astronauts and Apollo Missions : Wikipedia and its authors, licensed under CC-BY-SA available from here:\nhttps://creativecommons.org/licenses/by-sa/3.0"
    
    var body: some View {
        Form {
            Section(header: Text("NASA").font(.headline)) {
                Text(self.nasaCredit)
                    .padding()
            }
            Section(header: Text("WIKIPEDIA").font(.headline)) {
                Text(self.wikipediaCredit)
                    .padding()
            }
        }.navigationBarTitle("Credits", displayMode: .inline)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
