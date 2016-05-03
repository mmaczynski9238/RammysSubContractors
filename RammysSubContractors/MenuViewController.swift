//
//  MenuViewController.swift
//  RammysSubContractors
//
//  Created by Michael Maczynski on 5/3/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, ENSideMenuDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Move next line to viewWillAppear functon if you store your view controllers
        self.sideMenuController()?.sideMenu?.delegate = self
        
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }
    
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")
        return true
    }
    
    
}
