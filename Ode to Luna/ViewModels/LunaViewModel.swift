//
//  LunaViewModel.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 14/06/21.
//

import Foundation

class LunaViewModel {
    let astronauts: [AstronautModel] = Bundle.main.decode("astronauts.json")
    let missions: [MissionModel] = Bundle.main.decode("missions.json")
}
