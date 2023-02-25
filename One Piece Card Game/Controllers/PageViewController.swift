//
//  PageViewController.swift
//  One Piece Card Game
//
//  Created by Yehor Krupiei on 16.02.2023.
//

import UIKit
import ImageIO

class PageViewController: UIPageViewController {
    
    let presentScreenContent = ["Welcome to the One Piece world card game! We wish you a pleasant pastime. We hope you enjoy and achieve all your goals!", "Find the same cards and earn belly!", "Buy new characters for belly (which will bring more belly) and decorations.", "Good luck pirate! I hope you find one piece and become the king of the pirates."]
    
    let imageArray = [UIImage(named: "UIPage1")!, UIImage(named: "MatchCards")!, UIImage(named: "BuyCharachter")!, UIImage(named: "Lucky")!]

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
       
    }
    
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 else { return nil }
        guard index < presentScreenContent.count else {
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "presentationWasViewed")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.dismiss(animated: true)
            }
            return nil }
        guard let contentViewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else { return nil }
        
        contentViewController.text = presentScreenContent[index]
        contentViewController.content = imageArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = presentScreenContent.count
        
        return contentViewController
    }
    
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber += 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    
}
