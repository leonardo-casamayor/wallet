//
//  EWTitle.swift
//  wallet
//
//  Created by Leonardo Casamayor on 05/04/2022.
//

import SwiftUI

struct EWTitle: View {
    
    var title: String = ""
    
    var body: some View {
        Text(title)
            .foregroundColor(Theme.eldarBlue)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 40, weight: .medium, design: .default))
            .padding(.horizontal, FieldConstants.horizontalSpaceing)
    }
}

struct EWTitle_Previews: PreviewProvider {
    static var previews: some View {
        EWTitle(title: "Example Title")
    }
}
