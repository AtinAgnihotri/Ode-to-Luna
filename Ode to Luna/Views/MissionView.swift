//
//  MissionView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 13/06/21.
//

import SwiftUI

struct MissionView: View {
//    struct CrewMember {
//        let role: String
//        let astronaut: AstronautModel
//    }
    
    var mission: MissionModel
    var astronauts: [CrewMemberModel]
    
    
    init(_ mission: MissionModel, listOfAstronauts: [AstronautModel]) {
        self.mission = mission
        
        var matches = [CrewMemberModel]()
        
        for member in mission.crew {
            if let match = listOfAstronauts.first(where: { $0.id == member.name }) {
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
                Text(mission.description)
                    .padding()
                ForEach(self.astronauts, id:\.role) { crewMember in
                    NavigationLink (destination: AstronautView(crewMember.astronaut),
                    label: {
                        CrewMemberView(crewMember)
                    })
                }
                
                Spacer(minLength: 25)
                
            }
        }.navigationBarTitle(mission.displayName, displayMode: .inline)
    }
    
    
    
}

struct MissionView_Previews: PreviewProvider {
    static var missions: [MissionModel] = Bundle.main.decode("missions.json")
    static var astronauts: [AstronautModel] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(
            missions[0], listOfAstronauts: astronauts
        )
    }
    
}
