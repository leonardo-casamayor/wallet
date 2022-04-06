//
//  SignUp.swift
//  wallet
//
//  Created by Leonardo Casamayor on 05/04/2022.
//

import SwiftUI
import FirebaseAuth

struct SignUp: View {
    
    var sessionController = firebaseController()
    @State var name: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var pass: String = ""
    
    var body: some View {
        
        VStack(spacing: 100) {
            
                EWTitle(title: "Create Account")
            
            VStack() {
                EWTextField(text: $name, placeholder: "Name").padding(.bottom, 10)
                EWTextField(text: $lastName, placeholder: "Last Name").padding(.bottom, 10)
                EWTextField(text: $email, placeholder: "Email").padding(.bottom, 10)
                EWTextField(text: $pass, placeholder: "Password").padding(.bottom, 10)
                EWButton(buttonText: "Sign Up") {
                    createUser()
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

extension SignUp {
    
    func createUser(){
        sessionController.createUser(withEmail: self.email, andPassword: self.pass) { result, error in
            //add user to db
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
