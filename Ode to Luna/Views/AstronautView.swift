//
//  AstronautView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 14/06/21.
//

import SwiftUI

struct AstronautView: View {
    var astronaut: AstronautModel
    
    init(_ astronaut: AstronautModel) {
        self.astronaut = astronaut
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView (.vertical) {
                VStack (alignment: .center) {
                    Image(astronaut.id)
                        .resizable()
                        .frame(maxWidth: geo.size.width * 0.95)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .overlay(RoundedRectangle(cornerRadius: 25.0)
                                    .stroke(Color.primary, lineWidth: 5)
                        )
                        
                }.frame(width: geo.size.width) // Without this image aligns weirdly to leading
//                Text(astronaut.name)
//                    .font(.title)
//                    .padding()
                
                Text(astronaut.description)
                    .padding()
            }
        }.navigationBarTitle(astronaut.name, displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [AstronautModel] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronauts[0])
    }
}
