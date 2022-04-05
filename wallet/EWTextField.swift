//
//  EWTextField.swift
//  wallet
//
//  Created by Leonardo Casamayor on 04/04/2022.
//

import SwiftUI

struct EWTextField: View {
    
    @State var text: String = ""
    
    var body: some View {
        TextField("Email",text: $text)
            .padding()
            .background(Theme.textFieldBackground)
            .cornerRadius(8.0)
            .padding(.horizontal, FieldConstants.horizontalSpaceing)
    }
}

struct EWTextField_Previews: PreviewProvider {
    static var previews: some View {
        EWTextField(text: "")
    }
}
