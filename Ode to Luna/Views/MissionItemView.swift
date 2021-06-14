//
//  MissionItemView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 14/06/21.
//

import SwiftUI

struct MissionItemView: View {
    let luna = LunaViewModel()
    var mission: MissionModel
    var showDate: Bool
    var crew: [CrewMemberModel]
    
    var crewNames: String {
        var names = ""
        for i in crew {
            names += i.astronaut.name + ", "
        }
        names = names.trimmingCharacters(in: .whitespacesAndNewlines)
        names.removeLast()
        return names
    }
    
    init(_ mission: MissionModel, showDate: Bool) {
        self.mission = mission
        self.showDate = showDate
        
        var matches = [CrewMemberModel]()
        
        for member in mission.crew {
            if let match = luna.astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMemberModel(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        
        self.crew = matches
        
    }
    
    
    
    var body: some View {
        HStack {
            Image(mission.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .clipped()
                .padding()
            Spacer()
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .padding()
                Text(showDate ? mission.formattedDate : crewNames)
                    .font(.caption)
            }
        }
    }
}

struct MissionItemView_Previews: PreviewProvider {
    static var missions: [MissionModel] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionItemView(missions[1], showDate: false)
    }
    
}
