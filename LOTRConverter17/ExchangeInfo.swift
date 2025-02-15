//
//  ExchangeInfo.swift
//  LOTRConverter17
//
//  Created by Salah Badreddine on 8/7/2024.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // The background image
            Image (.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                // The title
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                // Description text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .padding()
                    .font(.title2)
                    .multilineTextAlignment(.center)
                
                // Exchange rates
                ExchangeRate(leftImage: .goldpiece, DisplayText: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
                ExchangeRate(leftImage: .goldpenny, DisplayText: "1 Gold Penny = 4 Silver Pieces", rightImage: .silverpiece)
                ExchangeRate(leftImage: .silverpiece, DisplayText: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                ExchangeRate(leftImage: .silverpenny, DisplayText: "1 Silver Penny = 100 Copper Pennies", rightImage: .copperpenny)
                
                // Done button
                Button {
                    // action
                    dismiss()
                } label: {
                    Text("Done")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .padding()
            }
            .foregroundColor(.black)
        }
    }
}


#Preview {
    ExchangeInfo()
}

