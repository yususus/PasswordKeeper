//
//  SocialMedia.swift
//  Password Keeper
//
//  Created by yusuf on 17.08.2024.
//

import SwiftUI

struct SocialMediaAccount: Identifiable {
    var id = UUID() 
    var platform: String
    var username: String
    var password: String
    var email: String
    var saveEmail: String
    var saveCode: String
}

struct SocialMedia: View {
    @State private var accounts: [SocialMediaAccount] = [
        SocialMediaAccount(platform: "Facebook", username: "", password: "", email: "", saveEmail: "", saveCode: ""),
        SocialMediaAccount(platform: "Instagram", username: "", password: "", email: "", saveEmail: "", saveCode: ""),
        SocialMediaAccount(platform: "Snapchat", username: "", password: "", email: "", saveEmail: "", saveCode: ""),
        SocialMediaAccount(platform: "Twitter", username: "", password: "", email: "", saveEmail: "", saveCode: ""),
        SocialMediaAccount(platform: "LinkedIn", username: "", password: "", email: "", saveEmail: "", saveCode: "")
    ]
    
    var body: some View {
        List($accounts) { $account in
            DisclosureGroup(account.platform) {
                VStack {
                    TextField("Username", text: $account.username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Password", text: $account.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Email", text: $account.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Save Email", text: $account.saveEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Save Code", text: $account.saveCode)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
            }
        }
    }
}



#Preview {
    SocialMedia()
}
