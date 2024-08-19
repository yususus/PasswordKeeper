//
//  SaveCardView.swift
//  Password Keeper
//
//  Created by yusuf on 18.08.2024.
//

import SwiftUI

struct SaveCardView: View {
    @State private var iban: String = ""
    @State private var cardNumber: String = ""
    @State private var expirationDate: String = ""
    @State private var cvv2: String = ""
    @State private var cardName: String = ""
    
    @AppStorage("savedIBAN") private var savedIBAN: String = ""
    @AppStorage("savedCardNumber") private var savedCardNumber: String = ""
    @AppStorage("savedExpirationDate") private var savedExpirationDate: String = ""
    @AppStorage("savedCVV2") private var savedCVV2: String = ""
    @AppStorage("savedCardName") private var savedCardName: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Card Name", text: $cardName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("IBAN", text: $iban)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Kart Numarası", text: $cardNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Son Kullanma Tarihi", text: $expirationDate)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("CVV2", text: $cvv2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: saveCardDetails) {
                Text("Kaydet")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Kredi Kartı Bilgilerini Kaydet")
    }
    
    func saveCardDetails() {
        savedCardName = cardName
        savedIBAN = iban
        savedCardNumber = cardNumber
        savedExpirationDate = expirationDate
        savedCVV2 = cvv2
    }
}
#Preview {
    SaveCardView()
}
