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
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    TextField("Title", text: $title)
                        .font(.title)
                        .padding()
                    
                }
                
                
                Divider()
                    .frame(width: 350,height: 1)
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
        }.background(Color.brown.opacity(0.5))
        
        //sanki başka bir sayfadan gelmiş gibi davranır
            .toolbar {
                // Back butonunu özelleştirmek için
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Geri gitme aksiyonu
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        HStack {
                            Image(systemName: "arrowshape.left.fill")
                                .foregroundStyle(Color.black)// Geri butonu simgesi
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Butonun işlevi burada olacak
                    }, label: {
                        Text("Save").foregroundStyle(Color.white)
                            .frame(width: 100,height: 30)
                            .background(Color.brown.opacity(0.8))
                            .clipShape(.rect(cornerRadius: 10))
                            .fontWeight(.bold)
                    })
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbarBackground(Color.brown.opacity(0.5), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    //burada da başka bir sayfadan gelmiş gibi görmemizi sağlar
    NavigationView {
        AddNotes()
    }
}
