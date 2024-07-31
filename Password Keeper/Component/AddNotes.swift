//
//  AddNotes.swift
//  Password Keeper
//
//  Created by yusuf on 31.07.2024.
//

import SwiftUI

struct AddNotes: View {
    @State var text: String = ""
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    TextField("Title", text: $text)
                        .font(.title)
                        .padding()
                        .padding()
                    
                }
                
                Divider()
                    .frame(width: 350,height: 1)
                    .overlay(.black)
                VStack(alignment: .leading) {
                    VStack {
                        TextField("Placeholder", text: $text, axis: .vertical)
                            .padding()
                            .cornerRadius(15)
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    AddNotes()
}
