//
//  Currency.swift
//  LOTRConverter17
//
//  Created by Salah Badreddine on 9/7/2024.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    
    case copperPenny = 6400 // this is a raw value !
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: Currency { self }
    
    var image: ImageResource {
        switch self {
        case .copperPenny:
            .copperpenny // we can remove return because Swift can infer that this is the return computed value
        case .silverPenny:
            .silverpenny
        case .silverPiece:
            .silverpiece
        case .goldPenny:
            .goldpenny
        case .goldPiece:
            .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            return "Copper Penny"
        case .silverPenny:
            return "Silver Penny"
        case .silverPiece:
            return "Silver Piece"
        case .goldPenny:
            return "Gold Penny"
        case .goldPiece:
            return "Gold Piece"
        }
    }
    // Self is equivalent to this pointer in C++
    
    func convert (_ amount: String, to currency: Currency) -> String {
        guard let doubleAmount = Double(amount) else {
            return ""
        }
        let result = (doubleAmount / self.rawValue ) * currency.rawValue
        return String(format: "%.2f", result)
    }
}

// Can we use Int instead of Double ??


