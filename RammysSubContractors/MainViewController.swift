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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
    }
    
    @IBAction func toggleMainSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    

    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")
        return true
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }
}

