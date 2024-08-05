//
//  AddPassword.swift
//  Password Keeper
//
//  Created by yusuf on 4.08.2024.
//

import SwiftUI


struct AddPassword: View {
    @State private var items: [String] = []
    @State private var inputValues: [Int: (String, String)] = [:]
    @State private var selectedItem: Int? = nil
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    private let userDefaultsManager = UserDefaultsManager()

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
            // secure field yapılmalı 
                        TextField("Password", text: Binding(
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
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrowshape.left.fill")
                            .foregroundColor(.black)
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    saveItem()
                }, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 30)
                        .background(Color.brown.opacity(0.8))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .fontWeight(.bold)
                })
            }
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    addItem()
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                })
            }
        }
        .onAppear {
            loadItems()
        }
        .navigationBarBackButtonHidden(true)
    }

    private func addItem() {
        let newItemIndex = items.count
        items.append("Item \(newItemIndex + 1)")
        inputValues[newItemIndex] = ("", "")
        selectedItem = newItemIndex
    }

    private func saveItem() {
        guard let selectedItem = selectedItem else { return }
        if let name = inputValues[selectedItem]?.0, !name.isEmpty,
           let password = inputValues[selectedItem]?.1, !password.isEmpty {
            userDefaultsManager.saveItem(name: name, password: password)
            items[selectedItem] = name // Öğenin adını güncelle
        }
    }

    private func loadItems() {
        let savedItems = userDefaultsManager.fetchItems()
        for (name, password) in savedItems {
            items.append(name)
            inputValues[items.count - 1] = (name, password) // Şifreyi de ekle
        }
    }

}


#Preview {
    NavigationView{
        AddPassword()
    }
}
