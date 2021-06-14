//
//  MissionItemView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 14/06/21.
//

import SwiftUI

struct MissionItemView: View {
    var mission: MissionModel
    
    init(_ mission: MissionModel) {
        self.mission = mission
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
                Text(mission.formattedDate)
                    .font(.caption)
            }
        }
    }
}

struct MissionItemView_Previews: PreviewProvider {
    static var missions: [MissionModel] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionItemView(missions[1])
    }
    
}
