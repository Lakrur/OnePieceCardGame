//
//  DecorDetailShopViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 10.02.2023.
//

import UIKit

class DecorDetailShopViewController: UIViewController {
    
    @IBOutlet weak var decorImage: UIImageView!
    @IBOutlet weak var decorLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    var labelRecive = String()
    var imageRecive = UIImage()
    var priceRecive = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        priceLabel.numberOfLines = 0
        decorImage.image = imageRecive
        decorLabel.text = labelRecive
        priceLabel.text = "The cost of this decoration: \(formatNumber(number: Int(priceRecive)!)) belly"
        
    }
}
