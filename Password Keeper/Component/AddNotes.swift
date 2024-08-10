//
//  AddNotes.swift
//  Password Keeper
//
//  Created by yusuf on 31.07.2024.
//

import SwiftUI

struct AddNotes: View {
    @State var title: String = ""
    @State var noteText: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    private let userDefaultsManager = NotesSaveData()

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    TextField("Title", text: $title)
                        .font(.title)
                        .padding()
                        .disabled(true) // Başlık düzenlenemez olacak şekilde ayarlandı
                }

                Divider()
                    .frame(width: 350, height: 1)
                    .overlay(.black)

                VStack(alignment: .leading) {
                    VStack {
                        TextField("Placeholder", text: $noteText, axis: .vertical)
                            .padding()
                            .cornerRadius(15)
                            .padding()
                    }
                }
            }
        }
        .background(Color.brown.opacity(0.5))
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrowshape.left.fill")
                            .foregroundStyle(Color.black)
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    saveNote()
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Save")
                        .foregroundStyle(Color.white)
                        .frame(width: 100, height: 30)
                        .background(Color.brown.opacity(0.8))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .fontWeight(.bold)
                })
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbarBackground(Color.brown.opacity(0.5), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .onAppear {
            loadNote()
        }
    }

    private func saveNote() {
        if !title.isEmpty && !noteText.isEmpty {
            userDefaultsManager.saveNote(title: title, noteText: noteText)
            print("Not kaydedildi: \(title)")
        }
    }

    private func loadNote() {
        if let savedNote = userDefaultsManager.getNoteContent(title: title) {
            noteText = savedNote
        }
    }
}



#Preview {
    //burada da başka bir sayfadan gelmiş gibi görmemizi sağlar
    NavigationView {
        AddNotes()
    }
}
