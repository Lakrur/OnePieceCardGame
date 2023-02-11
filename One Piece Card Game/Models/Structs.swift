//
//  Structs.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 02.02.2023.
//

import UIKit

struct AllCharachter {
    
    var id: Int
    var picture: UIImage
    var rarity: rarety
    var description: String
    var isPurchased = false
}

struct AllFlags {

    var picture: UIImage
    var description: String
    var isPurchased = false
    var price = 350_000
    
}
