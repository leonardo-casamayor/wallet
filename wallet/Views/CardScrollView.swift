//
//  CardScrollView.swift
//  wallet
//
//  Created by Leonardo Casamayor on 10/04/2022.
//

import SwiftUI

struct CardScrollView: View {
    var cards: [Card]?
    let cardRatio = 1.7
    var body: some View {
        if let cards = cards {
            GeometryReader { geometry in
                VStack(spacing: 20){
                        ForEach(0..<cards.count, id: \.self) { i in
                            Tile(card: cards[i])
                                .foregroundColor(.white)
                                .padding(.all)
                                .background(Theme.eldarBlue)
                                .cornerRadius(8)
                                .frame(width: geometry.size.width, height: geometry.size.width/cardRatio)
                                .frame(width: geometry
                                        .size.width)
                        }
                    }
            }
        }
    }
}

struct CardScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CardScrollView(cards: [Card(number: "1234123412341234", owner: "Leonardo Casamayor", expriationDate: "01/01", securityCode: "123"), Card(number: "4321432143214321", owner: "Leonardo Casamayor", expriationDate: "02/02", securityCode: "321")])
    }
}

struct Tile: View {
    var card: Card
    var body: some View{
        VStack{
            Spacer()
            HStack{
                Text(card.number[0..<4])
                Text(card.number[4..<8])
                Text(card.number[8..<12])
                Text(card.number[12..<16])
            }.padding(.bottom, 20)
            HStack{
                Text(card.owner)
                Spacer()
            }
            HStack{
                Spacer()
                Text(card.expirationDate)
            }.padding(.vertical, 5)
        }
    }
}
extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}
