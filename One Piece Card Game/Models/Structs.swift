//
//  Structs.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 02.02.2023.
//

import UIKit

var belly = 0
weak var allBelly: UILabel!

struct AllCharachter {
    
    var id: Int
    var picture: UIImage
    var rarity: rarety
    var price: Int
    var description: String
    
}

var availableCharachter: [AllCharachter] =
[AllCharachter(id: 1, picture: UIImage(named: "babyLuffy")!, rarity: .common, price: 0, description: "luffy"),
 AllCharachter(id: 2, picture: UIImage(named: "babyZoro")!, rarity: .common, price: 0, description: "zoro"),
 AllCharachter(id: 3, picture: UIImage(named: "babyCoby")!, rarity: .common, price: 0, description: "coby"),
 AllCharachter(id: 4, picture: UIImage(named: "babyUsopp")!, rarity: .common, price: 0, description: "usopp"),
 AllCharachter(id: 5, picture: UIImage(named: "alvida")!, rarity: .common, price: 0, description: "alvida"),
 AllCharachter(id: 6, picture: UIImage(named: "buggy")!, rarity: .common, price: 0, description: "buggy"),
 AllCharachter(id: 7, picture: UIImage(named: "helmeppo")!, rarity: .common, price: 0, description: "helmepo"),
 AllCharachter(id: 8, picture: UIImage(named: "morgan")!, rarity: .common, price: 0, description: "morgan"),
 AllCharachter(id: 9, picture: UIImage(named: "nami1ep")!, rarity: .common, price: 0, description: "nami")].shuffled()

var shopCharachters: [AllCharachter] =
[AllCharachter(id: 10, picture: UIImage(named: "chopper")!, rarity: .uncommon, price: 200, description: "chopper"),
 AllCharachter(id: 11, picture: UIImage(named: "katakuri")!, rarity: .epic, price: 10000, description: "katakuri")]
