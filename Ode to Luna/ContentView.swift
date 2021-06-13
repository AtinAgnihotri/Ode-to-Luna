//
//  ContentView.swift
//  Ode to Luna
//
//  Created by Atin Agnihotri on 13/06/21.
//

import SwiftUI

struct CustomText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new Custom Text")
        self.text = text
    }
}

struct ContentView: View {
    // List acts Lazily, creating views when needed while ScrollView creates all the items at once
    var body: some View {
        NavigationView {
            VStack {
                Button ("Decode JSON") {
                    let json = """
                        {
                            "name": "Commander Shepard",
                            "address": {
                                "uri": "ARCTU.SEC3.DA0998ARK",
                                "street": "DA 099, 8th ARK, Sector 3, Arcturus Station"
                            }
                        }
                        """
                    
                    struct User: Codable {
                        var name: String
                        var address: Address
                    }
                    
                    struct Address: Codable {
                        var uri: String
                        var street: String
                    }
                    
                    let data = Data(json.utf8)
                    let decoder = JSONDecoder()
                    
                    if let decodedData = try? decoder.decode(User.self, from: data) {
                        print(decodedData.name)
                        print(decodedData.address.uri)
                        print(decodedData.address.street)
                    }
                    
                            
                }
            }.navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
