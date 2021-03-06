//
//  TabBar.swift
//  wallet
//
//  Created by Leonardo Casamayor on 06/04/2022.
//

import SwiftUI

struct TabBar: View {
    
    @Environment(\.managedObjectContext) var moc
    var mail = ""
    var body: some View {
        NavigationView {
            TabView {
                Home(email: mail).environment(\.managedObjectContext, moc)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                AddCard(email: mail).environment(\.managedObjectContext, moc)
                    .tabItem {
                        Image(systemName: "creditcard")
                        Text("New Card")
                    }
                
                QRCode(email: mail).environment(\.managedObjectContext, moc)
                    .tabItem {
                        Image(systemName: "qrcode")
                        Text("QR Code")
                    }
                
                NFCPay(email: mail).environment(\.managedObjectContext, moc)
                    .tabItem {
                        Image(systemName: "wave.3.right")
                        Text("NFC Pay")
                    }
            }
        }.navigationTitle("Tab Bar")
            .navigationBarHidden(true)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
