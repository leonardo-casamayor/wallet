//
//  SessionController.swift
//  wallet
//
//  Created by Leonardo Casamayor on 06/04/2022.
//

import Foundation
import FirebaseAuth

protocol SessionController {
    func createUser(withEmail email: String, andPassword pass: String, completion: @escaping ((AuthDataResult?, Error?) -> Void))
    func signIn(withEmail email: String, andPassword pass: String, completion: @escaping ((AuthDataResult?, Error?) -> Void))
    func logOut()
}

class firebaseController: SessionController {
    
    func createUser(withEmail email: String, andPassword pass: String, completion: @escaping ((AuthDataResult?, Error?) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: pass, completion: completion)
    }
    
    func signIn(withEmail email: String, andPassword pass: String, completion: @escaping ((AuthDataResult?, Error?) -> Void)) {
        Auth.auth().signIn(withEmail: email, password: pass, completion: completion)
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        }
        catch{
            print("Error in user log out.")
        }
    }
    
    
}
