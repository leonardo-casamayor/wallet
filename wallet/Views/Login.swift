//
//  Login.swift
//  wallet
//
//  Created by Leonardo Casamayor on 04/04/2022.
//

import SwiftUI

struct Login: View {
    
    var sessionController = firebaseController()
    @State private var selection: String? = nil
    @State var email: String = ""
    @State var pass: String = ""
    
    var body: some View {
        
        NavigationView {
            
        VStack(spacing: 60) {
            
            Image("eldar-logo")
                .resizable()
                .frame(width: 250, height: 250, alignment: .center)
            
            VStack() {
                
                EWTextField(text: $email, placeholder: "Email")
                EWSecureField(text: $pass).padding(.top, 10)
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

extension Login {
    
    func signIn(){
        sessionController.signIn(withEmail: self.email, andPassword: self.pass) { result, error in
            //go to home
            if let result = result, error == nil {
                print("Mail: \(result.user.email!), passw: \(pass)")
            }
            else {
                print("Error: \(String(describing: error))")
            }
        }
    }
}
