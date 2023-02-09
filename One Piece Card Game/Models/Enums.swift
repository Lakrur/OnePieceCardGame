//
//  Enums.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 02.02.2023.
//

import UIKit

enum rarety {
    case common
    case uncommon
    case rare
    case epic
    case legendary
    
    var price: Int {
        switch self {
        case .common:
            return 5000
        case .uncommon:
            return 25_000
        case .rare:
            return 60000
        case .epic:
            return 350_000
        case .legendary:
            return 1_000_000
        }
    }
    var bring: Int {
        switch self {
        case .common:
            return 500
        case .uncommon:
            return 1000
        case .rare:
            return 3000
        case .epic:
            return 9000
        case .legendary:
            return 25_000
        }
    }
}

