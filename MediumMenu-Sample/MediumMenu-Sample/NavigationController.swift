//
//  NavigationController.swift
//  MediumMenu
//
//  Created by pixyzehn on 2/3/15.
//  Copyright (c) 2015 pixyzehn. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
   
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var menu: MediumMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyboard.instantiateViewControllerWithIdentifier("Home") as! HomeViewController
        setViewControllers([homeViewController], animated: false)

        let item1 = MediumMenuItem(title: "Home") {
            let homeViewController = storyboard.instantiateViewControllerWithIdentifier("Home") as! HomeViewController
            self.setViewControllers([homeViewController], animated: false)
        }
        
        let item2 = MediumMenuItem(title: "Top stories") {
            let topStoriesViewController = storyboard.instantiateViewControllerWithIdentifier("Top") as! TopStoriesViewController
            self.setViewControllers([topStoriesViewController], animated: false)
        }
        
        let item3 = MediumMenuItem(title: "Bookmarks") {
            let bookMarksViewController = storyboard.instantiateViewControllerWithIdentifier("Bookmarks") as! BookmarksViewController
            self.setViewControllers([bookMarksViewController], animated: false)
        }

        let item4 = MediumMenuItem(title: "Help") {
            let helpViewController = storyboard.instantiateViewControllerWithIdentifier("Help") as! HelpViewController
            self.setViewControllers([helpViewController], animated: false)
        }
        
        let item5 = MediumMenuItem(title: "Sign out") {
            let signoutViewController = storyboard.instantiateViewControllerWithIdentifier("Signout") as! SignoutViewController
            self.setViewControllers([signoutViewController], animated: false)
        }

        menu = MediumMenu(items: [item1, item2, item3, item4, item5], forViewController: self)
//        menu?.backgroundColor = UIColor.redColor()
//        menu?.textColor = UIColor.redColor()
//        menu?.highLightTextColor = UIColor.blueColor()
//        menu?.titleAlignment = .Right
//        menu?.height = 1000
//        menu?.titleFont = UIFont.systemFontOfSize(30)
//        menu?.panGestureEnable = false
    }
    
    func showMenu() {
        menu?.showMenu()
    }
}

extension UINavigationBar {
    public override func sizeThatFits(size: CGSize) -> CGSize {
        let newsize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, 60)
        return newsize
    }
}
