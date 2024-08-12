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
    @State private var reloadToggle: Bool = false  // addNote'da eklendiği bu sayfada otomatik güncelleme yapıyor
    
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
                    
                    NavigationLink(destination: AddNotes(reloadToggle: $reloadToggle)) {
                        Image(systemName: "plus.app.fill").font(.title2)
                            .foregroundStyle(Color.black)
                    }.padding()
                }
                
                List {
                    ForEach(Array(notes.keys), id: \.self) { title in
                        /* NavigationLink(destination: AddNotes(title: title, reloadToggle: $reloadToggle) ) {
                         Notes(head: title)
                         }*/
                        
                        ZStack {
                            NavigationLink(destination:
                               AddNotes(title: title, reloadToggle: $reloadToggle)
                            ) {
                                EmptyView()
                                    
                            }
                            .opacity(0)

                                Notes(head: title)
                                .frame(height: 60)
                        }
                    }.onDelete(perform: deleteNote)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }.scrollContentBackground(.hidden)
                
                    
            }.background(Color.yellow.opacity(0.1).gradient)
        }
        .onAppear {
            loadNotes()
        }
        .onChange(of: reloadToggle) { //sayfa değiştiğinde tetikleme işlemi
            loadNotes()
        }
        
    }
    
    private func loadNotes() {
        notes = notesSaveData.fetchNotes()
        print("Notlar yüklendi: \(notes)")
    }
    private func deleteNote(at offsets: IndexSet) {
        offsets.forEach { index in
            let title = Array(notes.keys)[index]
            notesSaveData.deleteNote(title: title)
        }
        loadNotes() //not sildikten sonra güncellemek için
    }
}



#Preview {
    ContentView()
}
