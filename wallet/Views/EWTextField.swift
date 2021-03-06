//
//  EWTextField.swift
//  wallet
//
//  Created by Leonardo Casamayor on 04/04/2022.
//

import SwiftUI

struct EWTextField: View {
    
    @Binding var text: String
    var placeholder: String = ""
    
    var body: some View {
        TextField(placeholder,text: $text)
            .padding()
            .background(Theme.textFieldBackground)
            .cornerRadius(8.0)
            .padding(.horizontal, FieldConstants.horizontalSpaceing)
    }
}

//struct EWTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        EWTextField(text: "", placeholder: "Email")
//    }
//}
