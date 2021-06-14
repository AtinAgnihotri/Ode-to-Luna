//
//  MissionView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 13/06/21.
//

import SwiftUI

struct MissionView: View {
    
    let luna = LunaViewModel()
    var mission: MissionModel
    var astronauts: [CrewMemberModel]
    
    
    init(_ mission: MissionModel) {
        self.mission = mission
    
        var matches = [CrewMemberModel]()
        
        for member in mission.crew {
            if let match = luna.astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMemberModel(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        
        self.astronauts = matches
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack (alignment: .center) {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.7)
                        .padding(.top)
                }.frame(width: geo.size.width) // Without this image aligns weirdly to leading
                Text("Launch Date: \(mission.formattedDate)")
                    .font(.headline)
                    .padding()
                Text(mission.description)
                    .padding()
                Section(header: Text("Crew").font(.headline)) {
                    ForEach(self.astronauts, id:\.role) { crewMember in
                        NavigationLink (destination: AstronautView(crewMember.astronaut),
                        label: {
                            CrewMemberView(crewMember)
                        }).buttonStyle(PlainButtonStyle())
                    }
                }
                
                Spacer(minLength: 25)
                
            }
        }.navigationBarTitle(mission.displayName, displayMode: .inline)
    }
    
    
    
}

struct MissionView_Previews: PreviewProvider {
    static var missions: [MissionModel] = Bundle.main.decode("missions.json")
    static var astronauts: [AstronautModel] = Bundle.main.decode("astronauts.json")
    static let luna = LunaViewModel()
    
    static var previews: some View {
        MissionView(
            missions[0]
        ).preferredColorScheme(.dark)
    }
    
}
