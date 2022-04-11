//
//  EWTextButton.swift
//  wallet
//
//  Created by Leonardo Casamayor on 05/04/2022.
//

import SwiftUI

struct EWTextButton: View {
    
    var buttonText: String = ""
    var completion: ()->()
    
    var body: some View {
        Button(action: {
            completion()
        })
        {
            Text(buttonText).font(.body)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .foregroundColor(.gray)
        .background(.clear)
        .padding(.horizontal, FieldConstants.horizontalSpaceing)
    }
}

struct EWTextButton_Previews: PreviewProvider {
    static var previews: some View {
        EWTextButton(buttonText: "Test"){}
    }
}
