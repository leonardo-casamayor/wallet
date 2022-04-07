//
//  walletApp.swift
//  wallet
//
//  Created by Leonardo Casamayor on 04/04/2022.
//

import SwiftUI
import Firebase

@main
struct walletApp: App {
    
    @StateObject private var dataController = DataController()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            Login()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
