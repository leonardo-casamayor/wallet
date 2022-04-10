//
//  NFCPay.swift
//  wallet
//
//  Created by Leonardo Casamayor on 08/04/2022.
//

import SwiftUI

struct NFCPay: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    @State private var showingSuccess = false
    @State private var showingError = false
    @State var amountInput: String = ""
    @State var selection: String? = nil
    
    var body: some View {
        VStack {
        NavigationView {
            
            VStack(spacing: 10) {
               EWTitle(title: "NFC Pay")
                NavigationView {
                VStack() {
                    EWTextField(text: $amountInput, placeholder: "Amount")
                        .padding(.bottom, 10)
                        .padding(.top, 90)
                    
                    NavigationLink(destination: ChooseCard(amount: amountInput, email: "leonardo.casamayor@gmail.com"), tag: "ChooseCard", selection: $selection){ EmptyView() }
                    EWButton(buttonText: "Next") {
                        selection = "ChooseCard"
                    }
                    .padding(.top, 30)
                    Spacer()
                    
                }
                }
            }.navigationTitle("NFC Pay")
                .navigationBarHidden(true)
        }.navigationBarBackButtonHidden(true)
        Spacer()
        }
    }
    init(email: String) {
        _users = FetchRequest<User>(sortDescriptors: [], predicate: NSPredicate(format: "email == %@", email))
    }
    }

//struct NFCPay_Previews: PreviewProvider {
//    static var previews: some View {
//        NFCPay()
//    }
//}
struct ChooseCard: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    var amount: String
    var body: some View {
        VStack {
//            Text("Input: \(amount), cards: \(users[0].name!)")
            ScrollView {
                CardScrollView(cards: users[0].returnCards(), amount: amount).padding(.horizontal, 20)
            }
            Spacer()
        }
    }
    init(amount: String, email: String) {
        self.amount = amount
        _users = FetchRequest<User>(sortDescriptors: [], predicate: NSPredicate(format: "email == %@", email))
    }
}

struct Result: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    var index: Int
    var amount: String
    var body: some View {
        VStack {
            Text("Payment amount: $\(amount)")
            CardScrollView(cards: [users[0].returnCards()[index]]).padding(.horizontal, 20)
        }
    }
    init(amount: String, email: String, index: Int) {
        self.amount = amount
        self.index = index
        _users = FetchRequest<User>(sortDescriptors: [], predicate: NSPredicate(format: "email == %@", email))
    }
}
