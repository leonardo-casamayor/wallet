//
//  User.swift
//  wallet
//
//  Created by Leonardo Casamayor on 10/04/2022.
//

import Foundation

extension User {
    func returnCards() -> [Card] {
        var previousCards: [Card] = []
        if let userCards = self.cards {
            previousCards = try! JSONDecoder().decode([Card].self, from: userCards)
        }
        return previousCards
    }
}
