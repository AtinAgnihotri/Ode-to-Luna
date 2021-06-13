//
//  PulsatingMoonView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 13/06/21.
//

import SwiftUI

struct PulsatingMoonView: View {
    @State private var scaleAmount : CGFloat = 1
    
    var body: some View {
        GeometryReader { geo in
            VStack (alignment: .center) {
                    Image("moon_sample")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.primary)
                                .scaleEffect(scaleAmount)
                                .animation(
                                    Animation.easeOut(duration: 1)
                                        .repeatForever(autoreverses: false)
                                ).frame(width: geo.size.width/1.2)
                        )
                        .onAppear {
                            self.scaleAmount = 2
                        }
            }.frame(width: geo.size.width, height: geo.size.height) // Without this image aligns to top
        }
    }
}

struct PulsatingMoonView_Previews: PreviewProvider {
    static var previews: some View {
        PulsatingMoonView()
    }
}
