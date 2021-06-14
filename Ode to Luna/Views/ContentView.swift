//
//  ContentView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 13/06/21.
//

import SwiftUI



struct ContentView: View {
    let astronauts: [AstronautModel] = Bundle.main.decode("astronauts.json")
    let missions: [MissionModel] = Bundle.main.decode("missions.json")
    
    let luna = LunaViewModel()
    
    var body: some View {
        NavigationView {
            List(luna.missions) { mission in
                NavigationLink (destination: MissionView(mission, lunaViewModel: luna),
                label: {
                        MissionItemView(mission)
                })
            }
            .navigationBarTitle("Ode to Luna")
            .navigationBarItems(trailing: NavigationLink (
                                    destination: CreditsView(),
                                    label: {
                                        Text("Credits")
                                    }
                                )
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
