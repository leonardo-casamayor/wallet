//
//  EWButton.swift
//  wallet
//
//  Created by Leonardo Casamayor on 04/04/2022.
//

import SwiftUI

struct EWButton: View {
    
    var buttonText = ""
    var completion: ()->()
    
    var body: some View {
        
        Button(action: {
            completion()
        })
        {
            Text(buttonText).font(.body)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .foregroundColor(.white)
        .padding(.all)
        .background(Theme.eldarBlue)
        .cornerRadius(8)
        .padding(.horizontal, 20)
    }
}

struct EWButton_Previews: PreviewProvider {
    static var previews: some View {
        EWButton(buttonText: "Log In") {}
    }
}
