//
//  BundleDecodable.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 13/06/21.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [Astronaut] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode([Astronaut].self, from: data) else {
            fatalError("Failed to load data from \(file)")
        }
        
        return decodedData
    }
}
