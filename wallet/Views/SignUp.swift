//
//  SignUp.swift
//  wallet
//
//  Created by Leonardo Casamayor on 05/04/2022.
//

import SwiftUI
import FirebaseAuth

struct SignUp: View {
    
    var sessionController = SessionController()
    @Environment(\.managedObjectContext) var moc
    @State private var selection: String? = nil
    @State var name: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var pass: String = ""
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 100) {
                
                EWTitle(title: "Create Account")
                
                VStack() {
                    EWTextField(text: $name, placeholder: "Name").padding(.bottom, 10)
                    EWTextField(text: $lastName, placeholder: "Last Name").padding(.bottom, 10)
                    EWTextField(text: $email, placeholder: "Email").padding(.bottom, 10)
                    EWSecureField(text: $pass).padding(.bottom, 10)
                    
                    NavigationLink(destination: TabBar(mail: email).environment(\.managedObjectContext, moc), tag: "Home", selection: $selection){ EmptyView() }
                    EWButton(buttonText: "Sign Up") {
                        createUser()
                        isLoggedIn = true
                        selection = "Home"
                    }
                    .padding(.top, 30)
                    Spacer()
                    
                }
            }.navigationTitle("Sign Up")
                .navigationBarHidden(true)
        }.navigationBarBackButtonHidden(isLoggedIn)
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
        user.key = Data(ContiguousArray(repeating: UInt8(Int.random(in: 1..<64)), count: 32))
        user.email = self.email
        user.name = self.name
        user.lastName = self.lastName
        
        try? moc.save()
    }
}
