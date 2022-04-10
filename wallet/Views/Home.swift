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
            Text("Count: \(users[0].returnCards().count)")
            ScrollView{
            CardScrollView(cards: users[0].returnCards(), navigate: false).padding(.horizontal, 20)
            }
            Spacer()
        }.navigationBarHidden(true)
        
    }
    init(email: String) {
        _users = FetchRequest<User>(sortDescriptors: [], predicate: NSPredicate(format: "email == %@", email))
    }
}

extension Home {
    func decodeCards() -> [Card] {
        var previousCards: [Card] = []
        if let userCards = users[0].cards {
            previousCards = try! JSONDecoder().decode([Card].self, from: userCards)
        }
        return previousCards
    }
}
