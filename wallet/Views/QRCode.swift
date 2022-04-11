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
    @State var selection: String? = nil
    @State var image = Image("eldar-logo")
    var networkController = NetworkController()
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 100) {
               EWTitle(title: "Generate QR Code")
                VStack() {
                    EWTextField(text: $amount, placeholder: "Amount").padding(.bottom, 10)
                    NavigationLink(destination: QRResult(amount: amount, email: users[0].email!, image: image), tag: "QRResult", selection: $selection){ EmptyView() }
                    EWButton(buttonText: "Generate") {
                        networkController.requestQRCode(content: "") { result in
                            switch result {
                            case .success(let qrCode):
                                self.image = qrCode
                                selection = "QRResult"
                            case .failure(_):
                                print("error")
                            }
                        }
                    }
                    .padding(.top, 30)
                    Spacer()
                    
                }
                Spacer()
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

struct QRResult: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    var amount: String
    var image: Image
    var body: some View {
        VStack {
            Text("Charge amount: $\(amount)")
            image
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
        }
    }
    init(amount: String, email: String, image: Image) {
        self.amount = amount
        self.image = image
        _users = FetchRequest<User>(sortDescriptors: [], predicate: NSPredicate(format: "email == %@", email))
    }
}
