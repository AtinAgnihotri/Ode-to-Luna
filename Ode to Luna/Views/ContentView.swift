//
//  ContentView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 13/06/21.
//

import SwiftUI



struct ContentView: View {
//    let astronauts: [AstronautModel] = Bundle.main.decode("astronauts.json")
//    let missions: [MissionModel] = Bundle.main.decode("missions.json")
    @State private var showDate = true
    
    let luna = LunaViewModel()
    
    var body: some View {
        NavigationView {
            List(luna.missions) { mission in
                NavigationLink (destination: MissionView(mission),
                label: {
                    MissionItemView(mission, showDate: showDate)
                })
            }
            .navigationBarTitle("Ode to Luna")
            .navigationBarItems(trailing: HomeBarButtonsView(text: showDate ? "Date" : "Crew", value: $showDate)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
