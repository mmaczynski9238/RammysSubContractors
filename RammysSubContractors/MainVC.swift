//
//  ViewController.swift
//  RammysSubContractors
//
//  Created by Michael Maczynski on 5/2/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit



class MainViewController: UIViewController, ENSideMenuDelegate {
    
    @IBOutlet var menuButtonMainVC: UIBarButtonItem!
    
    var isOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        initializeGestureRecognizer()

        
        self.sideMenuController()?.sideMenu?.delegate = self
        
    }
    
    @IBAction func toggleMainSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                if isOpen == true
                {
                    toggleSideMenuView()
                }
            default:
                break
            }
        }
    }
    
    func initializeGestureRecognizer()
    {
//        var tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("recognizeTapGesture:"))
//        view.addGestureRecognizer(tapGesture)
//    }
//    func recognizeTapGesture(sender: UIGestureRecognizer) {
//        if isOpen == true {
//            toggleSideMenuView()
//        }
    }
    
    
    func sideMenuDidClose() {
        isOpen = false
    }
    func sideMenuDidOpen() {
        isOpen = true
    }

    
   
}

