//
//  DecorationShopViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 09.02.2023.
//

import UIKit

class DecorationShopViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
