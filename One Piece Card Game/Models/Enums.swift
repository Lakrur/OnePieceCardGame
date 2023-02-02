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
            return 150
        case .uncommon:
            return 300
        case .rare:
            return 1200
        case .epic:
            return 3000
        case .legendary:
            return 6000
        }
    }
    var bring: Int {
        switch self {
        case .common:
            return 10
        case .uncommon:
            return 12
        case .rare:
            return 15
        case .epic:
            return 20
        case .legendary:
            return 30
        }
    }
}



