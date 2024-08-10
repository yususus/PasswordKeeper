//
//  ContentView.swift
//  Password Keeper
//
//  Created by yusuf on 27.05.2024.
//

import SwiftUI

struct ContentView: View {
    private let notesSaveData = NotesSaveData()
    @State private var notes: [String: String] = [:]
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Kayıtlı Şifreler")
                    .font(.largeTitle).fontWeight(.bold)
                    .padding([.top, .leading])
                
                ScrollView(.horizontal) {
                    HStack {
                        NavigationLink(destination: AddPassword()) {
                            Password(text: "Bank", image: "bank")
                        }
                    }.padding()
                }
                
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
                
                List {
                    ForEach(Array(notes.keys), id: \.self) { title in
                        /* NavigationLink(destination: AddNotes(title: title) ) {
                         Notes(head: title)
                         }*/
                        ZStack {
                            NavigationLink(destination:
                                            AddNotes(title: title)
                            ) {
                                EmptyView()
                            }
                                .opacity(0)
                            
                            HStack {
                                Notes(head: title)
                                
                            }
                        }
                    }.listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    
                    
                    
                }
            }
        }
        .onAppear {
            loadNotes()
        }
        
    }
    
    private func loadNotes() {
        notes = notesSaveData.fetchNotes()
        print("Notlar yüklendi: \(notes)")
    }
}



#Preview {
    ContentView()
}
