//
//  SignUp.swift
//  wallet
//
//  Created by Leonardo Casamayor on 05/04/2022.
//

import SwiftUI

struct SignUp: View {
    var body: some View {
        
        VStack(spacing: 100) {
            
                EWTitle(title: "Create Account")
                .padding(.top, 60)
            
            VStack() {
                EWTextField(text: "", placeholder: "Name").padding(.bottom, 10)
                EWTextField(text: "", placeholder: "Last Name").padding(.bottom, 10)
                EWTextField(text: "", placeholder: "Email").padding(.bottom, 10)
                EWSecureField(text: "")
                EWButton(buttonText: "Sign Up") {
                    print("Hello")
                }
                .padding(.top, 30)
                Spacer()
            }
        }
        }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
