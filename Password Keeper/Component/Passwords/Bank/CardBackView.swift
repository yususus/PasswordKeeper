//
//  CardBackView.swift
//  Password Keeper
//
//  Created by yusuf on 19.08.2024.
//

import SwiftUI

struct CardBackView: View {
    let cvv2: String
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 40)
                .foregroundColor(.black)
                .padding(.top, 10)
            
            Spacer()
            
            HStack {
                Spacer()
                Text("CVV2: \(cvv2)")
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
                Button(action: {
                    UIPasteboard.general.string = cvv2
                }) {
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 20)
            }
            
            Spacer()
        }
        .padding()
        .frame(width: 300,height: 180)
        .background(Color.blue)
        .cornerRadius(15)
        
    }
}

#Preview {
    CardBackView(cvv2: "786")
}
