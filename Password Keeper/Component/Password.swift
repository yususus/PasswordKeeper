//
//  component.swift
//  Password Keeper
//
//  Created by yusuf on 27.07.2024.
//

import SwiftUI

struct Password: View {
    var text:String
    var image:String
    var body: some View {
        HStack {
            Image(image).aspectRatio(contentMode: .fit).foregroundStyle(Color.black)
            Text(text).foregroundStyle(Color.black)
        }
        
        .frame(width: 150,height: 100)
            .background(Color.blue.opacity(0.3)).clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    Password(text: "Bank", image: "bank")
}
