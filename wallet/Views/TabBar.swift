//
//  TabBar.swift
//  wallet
//
//  Created by Leonardo Casamayor on 06/04/2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        
        TabView {
            Text("Home Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
         
            Text("New Card")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("New Card")
                }
         
            Text("Video Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "qrcode")
                    Text("QR Code")
                }
         
            Text("Profile Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "wave.3.right")
                    Text("NFC Pay")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
