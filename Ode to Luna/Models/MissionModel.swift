//
//  MissionModel.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 13/06/21.
//

import Foundation

struct MissionModel: Codable, Identifiable {
    
    struct CrewModel: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewModel]
    let description: String
}
