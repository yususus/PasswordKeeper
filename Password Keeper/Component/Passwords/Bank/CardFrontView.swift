//
//  CardFrontView.swift
//  Password Keeper
//
//  Created by yusuf on 19.08.2024.
//

import SwiftUI

struct CardFrontView: View {
    let cardNumber: String
    let expirationDate: String
    let iban: String
    let cardName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Spacer()
            Text(cardName)
                .font(.headline)
                .foregroundColor(.white)
            
            HStack {
                Text(cardNumber)
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    UIPasteboard.general.string = cardNumber
                }) {
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(.white)
                }
            }
            
            HStack {
                Text("Son Kullanma Tarihi: \(expirationDate)")
                    .font(.footnote)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    UIPasteboard.general.string = expirationDate
                }) {
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(.white)
                }
            }
            
            HStack {
                Text("IBAN: \(iban)")
                    .font(.footnote)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    UIPasteboard.general.string = iban
                }) {
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(.white)
                }
            }
        }.padding()
        .frame(width: 300,height: 180)
        .background(Color.green)
        .cornerRadius(15)
    }
}

#Preview {
    CardFrontView(cardNumber: "4345 0000", expirationDate: "12/27", iban: "TR31231", cardName: "dasda")
}
