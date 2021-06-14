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
    let launchDate: Date?
    let crew: [CrewModel]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var imageName: String {
        "apollo\(id)"
    }
    
    var formattedDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
}
