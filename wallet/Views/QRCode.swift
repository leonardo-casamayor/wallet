//
//  QRCode.swift
//  wallet
//
//  Created by Leonardo Casamayor on 08/04/2022.
//

import SwiftUI

struct QRCode: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    @State private var showingSuccess = false
    @State private var showingError = false
    @State var amount: String = ""
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 100) {
               EWTitle(title: "Generate QR Code")
                VStack() {
                    EWTextField(text: $amount, placeholder: "Amount").padding(.bottom, 10)
                    
//                    NavigationLink(destination: TabBar(mail: email).environment(\.managedObjectContext, moc), tag: "Home", selection: $selection){ EmptyView() }
                    EWButton(buttonText: "Generate") {
                        amount = ""
                    }
                    .padding(.top, 30)
                    Spacer()
                    
                }
            }.navigationTitle("QR Code")
                .navigationBarHidden(true)
        }.navigationBarBackButtonHidden(true)
    }
    init(email: String) {
        _users = FetchRequest<User>(sortDescriptors: [], predicate: NSPredicate(format: "email == %@", email))
    }
    }


//struct QRCode_Previews: PreviewProvider {
//    static var previews: some View {
//        QRCode()
//    }
//}
