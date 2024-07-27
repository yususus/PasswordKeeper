//
//  component.swift
//  Password Keeper
//
//  Created by yusuf on 27.07.2024.
//

import SwiftUI

struct component: View {
    var text:String
    var body: some View {
        Text(text).frame(width: 150,height: 100)
            .background(Color.blue.opacity(0.3)).clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    component(text: "Banka")
}
