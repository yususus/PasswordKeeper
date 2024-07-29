//
//  ContentView.swift
//  Password Keeper
//
//  Created by yusuf on 27.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                ScrollView(.horizontal){
                    HStack {
                        Password(text: "Bank", image: "bank")
                        Password(text: "Kasa", image: "password")
                        Password(text: "Sosyal Medya", image: "social")
                    }.padding()
                    
                }
                
                ScrollView(.vertical){
                    VStack{
                        
                    }
                }
            }.navigationTitle("Şifreler")
        }
    }
}

#Preview {
    ContentView()
}
