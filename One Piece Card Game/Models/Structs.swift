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
    var description: String
    var isPurchased = false
}

var availableCharachter: [AllCharachter] =
[AllCharachter(id: 1, picture: UIImage(named: "babyLuffy")!, rarity: .epic, description: "luffy", isPurchased: true),
 AllCharachter(id: 2, picture: UIImage(named: "babyZoro")!, rarity: .common, description: "zoro", isPurchased: true),
 AllCharachter(id: 3, picture: UIImage(named: "babyCoby")!, rarity: .common, description: "coby", isPurchased: true),
 AllCharachter(id: 4, picture: UIImage(named: "babyUsopp")!, rarity: .common, description: "usopp", isPurchased: true),
 AllCharachter(id: 5, picture: UIImage(named: "alvida")!, rarity: .common, description: "alvida", isPurchased: true),
 AllCharachter(id: 6, picture: UIImage(named: "buggy")!, rarity: .common, description: "buggy", isPurchased: true),
 AllCharachter(id: 7, picture: UIImage(named: "helmeppo")!, rarity: .common, description: "helmepo", isPurchased: true),
 AllCharachter(id: 8, picture: UIImage(named: "morgan")!, rarity: .common, description: "morgan", isPurchased: true),
 AllCharachter(id: 9, picture: UIImage(named: "nami1ep")!, rarity: .common, description: "nami", isPurchased: true)].shuffled()

var shopCharachters: [AllCharachter] =
[AllCharachter(id: 10, picture: UIImage(named: "chopper")!, rarity: .uncommon, description: "Tony Tony Chopper, also known as Cotton Candy Lover Chopper, is the doctor of the Straw Hat Pirates and one of the Senior Officers of the Straw Hat Grand Fleet. Chopper is a reindeer that ate the Hito Hito no Mi, a Devil Fruit that allows its user to transform into a human hybrid or a human at will. He came from Drum Island and was taught how to be a doctor by his two parental figures, Doctors Hiriluk and Kureha. His dream is to one day become a doctor capable of curing any disease and wants to travel all across the world specifically in the hopes of accomplishing this dream. His bounty is 1,000 belly.", isPurchased: false),
 AllCharachter(id: 11, picture: UIImage(named: "katakuri")!, rarity: .epic, description: "Charlotte Katakuri one of the Three Sweet Commanders of the Big Mom Pirates. Extremely tall, large, and muscular man standing in at 509 cm. His bounty is 1,057,000,000 belly. Katakuri wields a trident named Mogura in battle. He was first seen wielding it during Sanji and Charlotte Pudding's wedding ceremony. When not in use, he keeps the trident inside his mochi body. Katakuri is extremely skilled in wielding his trident Mogura, which he uses in conjunction with his Devil Fruit powers and physical prowess to perform devastating thrusts. Katakuri ate the Mochi Mochi no Mi, a Special Paramecia-type Devil Fruit that lets him create, control, and transform his body into mochi at will. His mochi is extremely thick and adhesive, allowing him to trap even extremely strong enemies with it, although it loses its effectiveness when exposed to liquids. Katakuri is one of the very few people in the world who can use all three types of Haki. Katakuri possesses extraordinary prowess in Observation Haki, being able to use an advanced form of Kenbunshoku that allows him to see visions several seconds ahead.", isPurchased: false)]

