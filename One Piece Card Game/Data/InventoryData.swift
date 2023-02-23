//
//  InventoryData.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 23.02.2023.
//

import Foundation
import UIKit
import RealmSwift


class BackgroundModel: Object {
   
    @Persisted var picture: Data
    @Persisted var price = 80_000
    @Persisted var isPurchased: Bool = false
    @Persisted var id: Int
    
    
    convenience init(picture: UIImage, isPurchased: Bool, id: Int) {
            self.init()
            self.picture = picture.pngData()!
            self.isPurchased = isPurchased
            self.id = id
        }
}
