//
//  HomeBarButtonsView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 15/06/21.
//

import SwiftUI

struct HomeBarButtonsView: View {
    var changeSublineText: String
    var changeSublineBinding: Binding<Bool>
    
    init(text changeSublineText: String, value changeSublineBinding: Binding<Bool>) {
        self.changeSublineText = changeSublineText
        self.changeSublineBinding = changeSublineBinding
    }
    
    var body: some View {
        HStack {
            NavigationLink (destination: CreditsView(),
                            label: {
                                Text("Credits")
                            }
            )
            Button(changeSublineText) {
                changeSublineBinding.wrappedValue.toggle()
            }
        }
    }
}

struct HomeBarButtonsView_Previews: PreviewProvider {
    @State static var toggler = false
//    static var toggleBinding = Binding(value: toggler)
    
    static var previews: some View {
        HomeBarButtonsView(text: "Stuff", value: $toggler)
    }
}
