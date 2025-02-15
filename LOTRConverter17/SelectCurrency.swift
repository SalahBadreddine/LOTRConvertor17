//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by Salah Badreddine on 9/7/2024.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var Dismiss
    @Binding var topCurrency: Currency // just like passing by
    @Binding var bottomCurrency: Currency // REFERENCE
    
    @FocusState var upperIcon
    @FocusState var lowerIcon
    
    var body: some View {
        ZStack {
            // Background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // The upper text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                // Currency icons
                // We could define an array and use the range!
                IconGrid(selectedCurrency: $topCurrency)
                
                // The lower text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                // Currency icons again (x2)
                IconGrid(selectedCurrency: $bottomCurrency)
                // Done button
                Button {
                    Dismiss()
                } label: {
                    Text("Done")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(topCurrency: .constant(.silverPiece), bottomCurrency: .constant(.goldPiece))
}

// an enum can have raw values 
// we access to it using: .rawValue 
