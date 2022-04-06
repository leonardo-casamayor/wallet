//
//  Login.swift
//  wallet
//
//  Created by Leonardo Casamayor on 04/04/2022.
//

import SwiftUI

struct Login: View {
    
    @State private var selection: String? = nil
    
    var body: some View {
        
        NavigationView {
            
        VStack(spacing: 60) {
            
            Image("eldar-logo")
                .resizable()
                .frame(width: 250, height: 250, alignment: .center)
            
            VStack() {
                
                EWTextField(text: "", placeholder: "Email")
                EWSecureField(text: "").padding(.top, 10)
                EWButton(buttonText: "Log In") {
                    print("Hello")
                }
                .padding(.top, 30)
                
                NavigationLink(destination: SignUp(), tag: "A", selection: $selection) {
                           
                EWTextButton(buttonText: "Don't have an account yet? Sign up") {
                    print("Its working")
                    selection = "A"
                }
                }.navigationBarHidden(true)
                
                Spacer().frame(height: 150)
            }
        }
        }
    }
    }

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
