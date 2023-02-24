//
//  Enums.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 02.02.2023.
//

import UIKit
import RealmSwift

enum Rarety: Int, PersistableEnum {
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

extension Rarety: _Persistable {
    public static var defaultValue: Rarety { return .common }
    
    public static func fromPersistedType(_ persistedValue: Int) -> Rarety? {
        switch persistedValue {
        case 0: return .common
        case 1: return .uncommon
        case 2: return .rare
        case 3: return .epic
        case 4: return .legendary
        default: return nil
        }
    }
    
    public var persistedValue: Int {
        switch self {
        case .common: return 0
        case .uncommon: return 1
        case .rare: return 2
        case .epic: return 3
        case .legendary: return 4
        }
    }
}
