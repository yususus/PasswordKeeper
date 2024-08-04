//
//  AddPassword.swift
//  Password Keeper
//
//  Created by yusuf on 4.08.2024.
//

import SwiftUI

struct AddPassword: View {
    @State private var items: [String] = ["Item 1", "Item 2", "Item 3"]
        @State private var inputValues: [Int: (String, String)] = [:]
        @State private var selectedItem: Int? = nil
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

        var body: some View {
            VStack {
                List(0..<items.count, id: \.self) { index in
                    DisclosureGroup(isExpanded: Binding(
                        get: { selectedItem == index },
                        set: { newValue in selectedItem = newValue ? index : nil }
                    )) {
                        VStack {
                            TextField("Name", text: Binding(
                                get: { inputValues[index]?.0 ?? "" },
                                set: { inputValues[index]?.0 = $0 }
                            ))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom, 5)
                            
                            SecureField("Password", text: Binding(
                                get: { inputValues[index]?.1 ?? "" },
                                set: { inputValues[index]?.1 = $0 }
                            ))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        .padding()
                    } label: {
                        Text(items[index])
                            .font(.headline)
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .toolbar {
                // Back butonunu özelleştirmek için
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Geri gitme aksiyonu
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        HStack {
                            Image(systemName: "arrowshape.left.fill")
                                .foregroundColor(.black) // Geri butonu simgesi
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Kaydetme işlemi burada olacak
                    }, label: {
                        Text("Save")
                            .foregroundColor(.white)
                            .frame(width: 100, height: 30)
                            .background(Color.brown.opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .fontWeight(.bold)
                    })
                    
                }
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        // Yeni eleman ekleme aksiyonu
                        addItem()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    })
                }
                
            }
            .navigationBarBackButtonHidden(true)
        }

        private func addItem() {
            // Yeni eleman ekleniyor
            let newItemIndex = items.count
            items.append("Item \(newItemIndex + 1)")
            inputValues[newItemIndex] = ("", "") // Boş değerler ekleniyor
            selectedItem = newItemIndex // Yeni eklenen eleman seçili hale getiriliyor
        }
}

#Preview {
    NavigationView{
        AddPassword()
    }
}
