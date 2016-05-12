//
//  ElkGroveMenuViewController.swift
//  RammysSubContractors
//
//  Created by Michael Maczynski on 5/3/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class ElkGroveSubsVC: UIViewController, ENSideMenuDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var ElkGroveMenuTableView: UITableView!
    
    var ElkGroveMenuArray:[Menu] = [Menu]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
        
    
        
        
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ElkGroveMenuArray.count
    }
    
    /************************************/
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let currentEGMenuItem = ElkGroveMenuArray[indexPath.row]
        let currentEGCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        currentEGCell.textLabel!.text = currentEGMenuItem.name
        currentEGCell.detailTextLabel?.text = currentEGMenuItem.description
        currentEGCell.backgroundColor = UIColor(red: 0.0, green: 64/255, blue: 128/255, alpha: 1.0)
        currentEGCell.textLabel!.textColor = UIColor.whiteColor()
        currentEGCell.detailTextLabel!.textColor = UIColor.whiteColor()
        

        
        //var image:UIImage = UIImage(named: "sub")!
        //currentCell.imageView!.image = image

        
        return currentEGCell
        
        
    }
    
    @IBAction func EGBackButton(sender: AnyObject) {
        
    }
    
    @IBAction func toggleElkGroveMenuSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
    }
