//
//  NoteDetailView.swift
//  Password Keeper
//
//  Created by yusuf on 7.08.2024.
//

import SwiftUI

struct NoteDetailView: View {
    var title: String
    private let notesSaveData = NotesSaveData()

    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()

            Spacer()

            NavigationLink(destination: AddNotes(title: title, noteText: notesSaveData.getNoteContent(title: title) ?? "")) {
                Text("Notu Düzenle")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.brown.opacity(0.8))
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Not Detayı")
    }
}


#Preview {
    NoteDetailView(title: "")
}
