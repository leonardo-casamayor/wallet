//
//  DataController.swift
//  wallet
//
//  Created by Leonardo Casamayor on 07/04/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "wallet")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("CoreData failed to load: \(error.localizedDescription)")
            }
        }
    }
}
