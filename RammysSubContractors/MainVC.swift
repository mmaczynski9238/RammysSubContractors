//
//  ViewController.swift
//  RammysSubContractors
//
//  Created by Michael Maczynski on 5/2/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit



class MainViewController: UIViewController, ENSideMenuDelegate {
    
    @IBOutlet weak var labelHP: UILabel!
    @IBOutlet var menuButtonMainVC: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    
    var isOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        initializeGestureRecognizer()

        
        self.sideMenuController()?.sideMenu?.delegate = self
        imageView.image = UIImage(named: "RAMMYS HP")
        
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
        var tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("recognizeTapGesture:"))
        view.addGestureRecognizer(tapGesture)
    }
    func recognizeTapGesture(sender: UIGestureRecognizer) {
        if isOpen == true {
            toggleSideMenuView()
        }
    }
    
    
    func sideMenuDidClose() {
        isOpen = false
    }
    func sideMenuDidOpen() {
        isOpen = true
    }

    
   
}

