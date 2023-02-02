//
//  DetailShopViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 01.02.2023.
//

import UIKit

class DetailShopViewController: UIViewController {

    
    @IBOutlet weak var passedImageView: UIImageView!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var butButton: UIButton!
    
    
    
    var imageReceived = UIImage()
    var information = String()
    var buttonText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passedImageView.image = imageReceived
        informationLabel.text = "\(information)"
        informationLabel.numberOfLines = 0
        
    }
    

    @IBAction func buyButton(_ sender: Any) {
        
    }
    
}
