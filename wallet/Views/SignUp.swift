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
    @Environment(\.managedObjectContext) var moc
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
    
    func createUser() {
        createFirebaseUser()
        createDBUser()
    }
    
    func createFirebaseUser(){
        sessionController.createUser(withEmail: self.email, andPassword: self.pass) { result, error in
            if let result = result, error == nil {
                print("Firebase succesfully added user for mail: \(result.user.email!)")
            }
            else {
                print("Firebase sign up error: \(String(describing: error))")
            }
        }
    }
    
    func createDBUser() {
        let user = User(context: moc)
        user.id = UUID()
        user.email = self.email
        user.name = self.name
        user.lastName = self.lastName
        
        try? moc.save()
    }
}
