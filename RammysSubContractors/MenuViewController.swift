//
//  MenuViewController.swift
//  RammysSubContractors
//
//  Created by Michael Maczynski on 5/3/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, ENSideMenuDelegate {
    
    @IBOutlet var menuButtonMenuVC: UIBarButtonItem!
    
    @IBOutlet weak var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuController()?.sideMenu?.delegate = self
    }
    
    @IBAction func toggleMenuSideMenu(sender: AnyObject) {
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
