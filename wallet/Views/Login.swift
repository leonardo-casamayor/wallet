//
//  Login.swift
//  wallet
//
//  Created by Leonardo Casamayor on 04/04/2022.
//

import SwiftUI

struct Login: View {
    
    var sessionController = firebaseController()
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
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
                    Text("Count: \(users.count)")
                    EWTextField(text: $email, placeholder: "Email")
                    EWTextField(text: $pass, placeholder: "Password").padding(.top, 10)
                    
                    NavigationLink(destination: TabBar(mail: email).environment(\.managedObjectContext, moc), tag: "Home", selection: $selection){
                        EWButton(buttonText: "Log In") {
                            signIn()
                        }
                        .padding(.top, 30)
                    }
                    NavigationLink(destination: SignUp(), tag: "A", selection: $selection) {
                        
                        EWTextButton(buttonText: "Don't have an account yet? Sign up") {
                            print("Its working")
                            selection = "A"
                        }
                    }
                    
                    Spacer().frame(height: 150)
                }
            }.navigationBarHidden(true)
                .navigationTitle("Login")
        }.statusBar(hidden: true)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

extension Login {
    
    func signIn(){
        sessionController.signIn(withEmail: "leonardo.casamayor@gmail.com", andPassword: "Helloooo") { result, error in
            if let result = result, error == nil {
                print("Firebase login succesful for user with mail: \(result.user.email!)")
                //go to home and send mail to it
                selection = "Home"
            }
            else {
                print("Error: \(String(describing: error))")
            }
        }
    }
}
