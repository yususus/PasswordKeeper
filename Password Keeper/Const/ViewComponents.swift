//
//  ViewComponents.swift
//  Password Keeper
//
//  Created by yusuf on 6.09.2024.
//

import Foundation
import SwiftUI

class TextFields{
    @ViewBuilder
    static func CustomTextFieldSecure(text : Binding<String>, placeHolder: String, hidden: Binding<Bool>)->  some View {
            VStack {
                HStack(alignment: .center) {
                    ZStack(alignment: .leading) {
                        if text.wrappedValue.isEmpty {
                            Text(placeHolder)
                                .foregroundColor(.black.opacity(0.6))
                        }
                        if hidden.wrappedValue {
                            SecureField("", text: text)
                                .foregroundColor(.black)
                        } else {
                            TextField("", text: text)
                                .foregroundColor(.black)
                        }
                        
                    }
                    Button(action: {
                        hidden.wrappedValue.toggle()
                    }) {
                        Image(systemName: hidden.wrappedValue ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.black)
                    }
                    
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.vertical, 10)
        }

}
