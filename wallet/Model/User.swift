//
//  User.swift
//  wallet
//
//  Created by Leonardo Casamayor on 10/04/2022.
//

import Foundation
import CryptoKit

extension User {
    func returnCards() -> [Card] {
        var cards: [Card] = []
        if let encryptedCards = self.cards, let keyData = self.key {
            let key = SymmetricKey(data: keyData)
            let sealBox = try! AES.GCM.SealedBox(combined: encryptedCards)
            let decryptedCards = try! AES.GCM.open(sealBox, using: key)
            cards = try! JSONDecoder().decode([Card].self, from: decryptedCards)
        }
        return cards
    }
}
