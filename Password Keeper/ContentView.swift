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
            ScrollView {
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
                        
                        }.padding()
                    }
                    List {
                        ForEach(Array(notes.keys), id: \.self) { title in
                            NavigationLink(destination: NoteDetailView(title: title)) {
                                Notes(head: title)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            loadNotes()
            print("not gösterildi")
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
