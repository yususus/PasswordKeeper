//
//  Card.swift
//  Password Keeper
//
//  Created by yusuf on 17.08.2024.
//

import SwiftUI

struct CardDetailsView: View {
    @AppStorage("savedIBAN") private var savedIBAN: String = ""
    @AppStorage("savedCardNumber") private var savedCardNumber: String = ""
    @AppStorage("savedExpirationDate") private var savedExpirationDate: String = ""
    @AppStorage("savedCVV2") private var savedCVV2: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: SaveCardView()) {
                                Text("Kredi Kartı Bilgilerini Kaydet")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
            if savedIBAN.isEmpty {
                Text("Henüz kredi kartı bilgisi kaydedilmedi.")
                    .font(.headline)
                    .padding()
            } else {
                VStack(spacing: 15) {
                    cardDetailView(title: "IBAN", value: savedIBAN)
                    cardDetailView(title: "Kart Numarası", value: savedCardNumber)
                    cardDetailView(title: "Son Kullanma Tarihi", value: savedExpirationDate)
                    cardDetailView(title: "CVV2", value: savedCVV2)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Kredi Kartı Bilgileri")
    }
    
    func cardDetailView(title: String, value: String) -> some View {
        HStack {
            Text("\(title): \(value)")
                .font(.headline)
            
            Spacer()
            
            Button(action: {
                UIPasteboard.general.string = value
            }) {
                Image(systemName: "doc.on.doc")
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    CardDetailsView()
}
