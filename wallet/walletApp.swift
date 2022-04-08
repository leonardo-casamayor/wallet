//
//  walletApp.swift
//  wallet
//
//  Created by Leonardo Casamayor on 04/04/2022.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
}

@main
struct walletApp: App {
    
    @StateObject private var dataController = DataController()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
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
