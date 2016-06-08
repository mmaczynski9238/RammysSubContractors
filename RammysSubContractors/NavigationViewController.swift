//
//  NavigationViewController.swift
//  RammysSubContractors
//
//  Created by Michael Maczynski on 5/3/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class NavigationController: ENSideMenuNavigationController, ENSideMenuDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: CustomTableViewController(), menuPosition:.Left)
        //sideMenu?.delegate = self //optional
        sideMenu?.menuWidth = 200.0 // optional, default is 160
        //sideMenu?.bouncingEnabled = false
        //sideMenu?.allowPanGesture = false
        // make navigation bar showing over side menu
        view.bringSubviewToFront(navigationBar)
    }
    
        
}

