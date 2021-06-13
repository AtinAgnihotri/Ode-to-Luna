//
//  MissionView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 13/06/21.
//

import SwiftUI

struct MissionView: View {
    var mission: MissionModel
    init(_ mission: MissionModel) {
        self.mission = mission
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image(mission.imageName).resizable()
                    .frame(width: 200, height: 200)
                    .aspectRatio(contentMode: .fit)
                List(0..<mission.crew.count) { crewCount in
                    HStack {
                        Text(mission.crew[crewCount].name)
                        Spacer()
                        Text(mission.crew[crewCount].role)
                    }
                }
                Text(mission.launchDate ?? "").padding()
                Text(mission.description).padding()
                Spacer()
            }.navigationBarTitle(mission.displayName)
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView(
            getMission()
        )
    }
    
    static func getMission() -> MissionModel {
        MissionModel(id: 1, launchDate: nil, crew: getCrew(), description: "Some Description")
    }
    
    static func getCrew() -> [MissionModel.CrewModel] {
        [
            MissionModel.CrewModel(name: "Test Pilot 1", role: "Commander"),
            MissionModel.CrewModel(name: "Test Pilot 2", role: "Lunar Module Pilot"),
            MissionModel.CrewModel(name: "Test Pilot 3", role: "Command Module Pilot")
        ]
    }
}
