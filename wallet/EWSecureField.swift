//
//  EWSecureField.swift
//  wallet
//
//  Created by Leonardo Casamayor on 04/04/2022.
//

import SwiftUI

struct EWSecureField: View {
    
    @State var text: String = ""
    
    var body: some View {
        SecureField("Password",text: $text)
            .padding()
            .background(Theme.textFieldBackground)
            .cornerRadius(8.0)
            .padding(.horizontal, FieldConstants.horizontalSpaceing)
    }
}

struct EWSecureField_Previews: PreviewProvider {
    static var previews: some View {
        EWSecureField(text: "")
    }
}
