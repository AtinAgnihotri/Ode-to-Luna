//
//  AstronautView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 14/06/21.
//

import SwiftUI

struct AstronautView: View {
    let luna = LunaViewModel()
    var astronaut: AstronautModel
    var astronautMissions: [MissionModel]

    
    init(_ astronaut: AstronautModel) {
        self.astronaut = astronaut
//        self.luna = lunaViewModel
        var matches = [MissionModel]()
        
        for i in luna.missions {
            if let match = i.crew.first(where: { $0.name == astronaut.id }) {
                matches.append(i)
            }
        }
        
        self.astronautMissions = matches
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView (.vertical) {
                VStack (alignment: .center) {
                    Image(astronaut.id)
                        .resizable()
                        .frame(maxWidth: geo.size.width * 0.95)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .overlay(RoundedRectangle(cornerRadius: 25.0)
                                    .stroke(Color.primary, lineWidth: 5)
                        )
                        
                }.frame(width: geo.size.width) // Without this image aligns weirdly to leading
                
                Text(astronaut.description)
                    .padding()
                Section(header: Text("Missions").font(.headline)) {
                    ForEach(self.astronautMissions, id:\.id) { mission in
                        NavigationLink (
                            destination: MissionView(mission),
                            label: {
                                MissionItemView(mission, showDate: true)
                                    .padding()
                            }).buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }.navigationBarTitle(astronaut.name, displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [AstronautModel] = Bundle.main.decode("astronauts.json")
    static let luna = LunaViewModel()
    static var previews: some View {
        AstronautView(astronauts[0])
    }
}
