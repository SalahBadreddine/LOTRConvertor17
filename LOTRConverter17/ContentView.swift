//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Salah Badreddine on 8/7/2024.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    // @State is a property wrapper that allows changing the value of the variable within
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    // is a special Bool
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    var body: some View {
        ZStack {
            // The background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                // The horse image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit() // We only need to set a hight, then the width will automatically fit
                    .frame(height: 200)
                // The title (Text)
                Text("Currency Exchange")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                HStack {
                    // Left conversion section
                    VStack {
                        // Currency
                        HStack {
                            // The currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            // The currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        
                        // Amount (Text field)
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                            
                    }
                    // The equal sign
                    Image(systemName: "equal") // we can treat SF symbols as both text or img
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .symbolEffect(.pulse)
                    // Right conversion section
                    VStack {
                        // Currency
                        HStack {
                            // The currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            // The currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        // Amount (Text field)
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)
                            
                    }
                }
                
                .padding()
                .background (.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer()
                
                // The info Button at the bottom-right corner
                
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                    }
                    .padding(.trailing)
                    // needs a binding bool because the view must change it later to false
                }
                
            }
//            .border(.blue)
        }
        .task {
            try? Tips.configure()
        }
        // Observations
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency, content: {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        })
        .onChange(of: leftCurrency, {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        })
        .onChange(of: rightCurrency, {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        })
        .onChange(of: leftAmount, {
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        })
        .onChange(of: rightAmount, {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        })
    }
    
}




#Preview {
    ContentView()
}
