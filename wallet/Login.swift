//
//  Login.swift
//  wallet
//
//  Created by Leonardo Casamayor on 04/04/2022.
//

import SwiftUI

struct Login: View {
    var body: some View {
        
        VStack(spacing: 60) {
            
            Image("eldar-logo")
                .resizable()
                .frame(width: 250, height: 250, alignment: .center)
                .padding(.top, 20)
            
            VStack() {
                
                EWTextField(text: "", placeholder: "Email")
                EWSecureField(text: "").padding(.top, 10)
                EWButton(buttonText: "Log In") {
                    print("Hello")
                }
                .padding(.top, 30)
                EWTextButton(buttonText: "Don't have an account yet? Sign up") {
                    print("Its working")
                }
                Spacer()
            }
        }
        }
    }

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
