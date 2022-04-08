//
//  AddCard.swift
//  wallet
//
//  Created by Leonardo Casamayor on 07/04/2022.
//

import SwiftUI

struct AddCard: View {
   
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    @State private var showingAlert = false
    @State var number: String = ""
    @State var owner: String = ""
    @State var expirationDate: String = ""
    @State var securityCode: String = ""
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 100) {
               EWTitle(title: "Add New Card Details")
                VStack() {
                    EWTextField(text: $number, placeholder: "Number").padding(.bottom, 10)
                    EWTextField(text: $owner, placeholder: "Owner").padding(.bottom, 10)
                    EWTextField(text: $expirationDate, placeholder: "Expiration Date").padding(.bottom, 10)
                    EWTextField(text: $securityCode, placeholder: "Security Code").padding(.bottom, 10)
                    
//                    NavigationLink(destination: TabBar(mail: email).environment(\.managedObjectContext, moc), tag: "Home", selection: $selection){ EmptyView() }
                    EWButton(buttonText: "Add Card +") {
                        var previousCards: [Card] = []
                        if let userCards = users[0].cards {
                            previousCards = try! JSONDecoder().decode([Card].self, from: userCards)
                        }
                        let newCard = Card(number: number, owner: owner, expriationDate: expirationDate, securityCode: securityCode)
                        previousCards.append(newCard)
                        let cardData = try? JSONEncoder().encode(previousCards)
                        users[0].cards = Data(cardData!)
                        try? moc.save()
                        number = ""
                        owner = ""
                        expirationDate = ""
                        securityCode = ""
                        showingAlert = true
                    }.alert("Card added correctly", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    .padding(.top, 30)
                    Spacer()
                    
                }
            }.navigationTitle("Add Card")
                .navigationBarHidden(true)
        }.navigationBarBackButtonHidden(true)
    }
    init(email: String) {
        _users = FetchRequest<User>(sortDescriptors: [], predicate: NSPredicate(format: "email == %@", email))
    }
}

//struct AddCard_Previews: PreviewProvider {
//    static var previews: some View {
//        AddCard()
//    }
//}
