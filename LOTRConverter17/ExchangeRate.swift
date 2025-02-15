//
//  ExchangeRate.swift
//  LOTRConverter17
//
//  Created by Salah Badreddine on 8/7/2024.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let DisplayText: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack {
            // Left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange rate text
            Text(DisplayText)
            
            // Right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

