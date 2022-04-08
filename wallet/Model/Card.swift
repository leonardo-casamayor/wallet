//
//  Card.swift
//  wallet
//
//  Created by Leonardo Casamayor on 07/04/2022.
//

import Foundation

class Card: Codable {
    let number: String
    let owner: String
    let expirationDate: String
    let securityCode: String
    
    init(number: String, owner: String, expriationDate: String, securityCode: String) {
        self.number = number
        self.owner = owner
        self.expirationDate = expriationDate
        self.securityCode = securityCode
    }
}
