//
//  Home.swift
//  wallet
//
//  Created by Leonardo Casamayor on 07/04/2022.
//

import SwiftUI

struct Home: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    var body: some View {
        VStack {
            EWTitle(title: "Welcome \(users[0].name!)!")
            Text("Count: \(users.count)")
            Spacer()
        }.navigationBarHidden(true)
        
    }
    init(email: String) {
        _users = FetchRequest<User>(sortDescriptors: [], predicate: NSPredicate(format: "email == %@", email))
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(email: "example@site.com")
    }
}
