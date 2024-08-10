//
//  ComponentNotes.swift
//  Password Keeper
//
//  Created by yusuf on 29.07.2024.
//

import SwiftUI

struct Notes: View {
    var head: String
    var body: some View {
        HStack {
            VStack() {
                Text(head)
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
            }
            Spacer()
            Image(systemName: "lock.circle.dotted").font(.title).foregroundStyle(Color.black)
        }
        .padding()
        .frame(width: 350, height: 75)
        .background(Color.green.gradient.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(radius: 3)
    }
}

#Preview {
    Notes(head: "Günlük")
}
