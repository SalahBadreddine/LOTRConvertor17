//
//  CurrencyIcon.swift
//  LOTRConverter17
//
//  Created by Salah Badreddine on 9/7/2024.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyIcon: ImageResource
    let currencyName: String
    var body: some View {
        ZStack(alignment: .bottom) {
            // Currency image
            Image(currencyIcon)
                .resizable()
                .scaledToFit()
            // Currency name
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currencyIcon: .copperpenny, currencyName: "Copper Penny")
}
