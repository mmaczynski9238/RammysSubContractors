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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuController()?.sideMenu?.delegate = self
        imageView.image = UIImage(named: "RAMMYS HP")
        
    }
    
    @IBAction func toggleMainSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    

    
   
}

