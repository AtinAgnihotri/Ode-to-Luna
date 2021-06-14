//
//  CrewMemberView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 14/06/21.
//

import SwiftUI

struct CrewMemberView: View {
    var crewMember: CrewMemberModel
    
    init(_ crewMember: CrewMemberModel) {
        self.crewMember = crewMember
    }
    
    var body: some View {
        HStack {
            Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 80, height: 50)
                .clipShape(Capsule())
                .overlay(Capsule()
                            .stroke(Color.primary, lineWidth: 1)
                )
            
            VStack (alignment: .leading) {
                Text(crewMember.astronaut.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(crewMember.role)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct CrewMemberView_Previews: PreviewProvider {
    static let astronauts: [AstronautModel] = Bundle.main.decode("astronauts.json")
    static let crewMember = CrewMemberModel(role: "pilot", astronaut: astronauts[0])
    
    static var previews: some View {
        CrewMemberView(crewMember)
    }
}
