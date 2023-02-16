//
//  ContentViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 16.02.2023.
//

import UIKit

class ContentViewController: UIViewController {
    
    
    @IBOutlet weak var presentText: UILabel!
    @IBOutlet weak var presentContent: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var text = ""
    var content = UIImage()
    var currentPage = 0
    var numberOfPages = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        presentText.text = text
        presentContent.image = content
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
    }
    

}

