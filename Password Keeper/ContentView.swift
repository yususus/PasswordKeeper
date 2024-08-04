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
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Kayıtlı Şifreler")
                        .font(.largeTitle).fontWeight(.bold)
                        .padding([.top, .leading])
                    
                    ScrollView(.horizontal) {
                        HStack {
                            NavigationLink(destination: AddPassword()) {
                                Password(text: "Bank", image: "bank")
                                Password(text: "Kasa", image: "password")
                                Password(text: "Sosyal Medya", image: "social")
                            }
                            
                        }.padding()
                    }
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Notlar")
                            .font(.largeTitle).fontWeight(.bold)
                            .padding([.top, .leading])
                        Spacer()
                        
                        NavigationLink(destination: AddNotes()) {
                            Image(systemName: "plus.app.fill").font(.title2)
                                .foregroundStyle(Color.black)
                        }.padding()
                    }
                    
                    ScrollView(.vertical) {
                        VStack {
                            Notes(head: "Günlük")
                            Notes(head: "Hakkında")
                            Notes(head: "Geleceğe Dair")
                            Notes(head: "Top Secret")
                        }.padding()
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
