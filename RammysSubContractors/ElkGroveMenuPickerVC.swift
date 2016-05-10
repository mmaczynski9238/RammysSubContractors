//
//  ElkGroveMenuPickerVC.swift
//  RammysSubContractors
//
//  Created by Michael Maczynski on 5/9/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class ElkGroveMenuPickerVC: UIViewController, ENSideMenuDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var ElkGroveMenuPickerTableView: UITableView!
    var ElkGroveMenuArray:[Menu] = [Menu]()
    var selectedMenuItem : Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
        
        ElkGroveMenuArray.append(Menu(name: "Drinks", description: ""))
        ElkGroveMenuArray.append(Menu(name: "Subs", description: ""))
        ElkGroveMenuArray.append(Menu(name: "Salads", description: ""))
        ElkGroveMenuArray.append(Menu(name: "Snacks", description: ""))

        ElkGroveMenuPickerTableView.selectRowAtIndexPath(NSIndexPath(forRow: selectedMenuItem, inSection: 0), animated: false, scrollPosition: .Middle)

    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ElkGroveMenuArray.count
    }
    
    /************************************/
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let currentEGMenuItem = ElkGroveMenuArray[indexPath.row]
        let currentEGMenuCell = tableView.dequeueReusableCellWithIdentifier("myEGMenuCell", forIndexPath: indexPath)
        currentEGMenuCell.textLabel!.text = currentEGMenuItem.name
        currentEGMenuCell.detailTextLabel?.text = currentEGMenuItem.description
        
        //var image:UIImage = UIImage(named: "sub")!
        //currentCell.imageView!.image = image
        
        
        return currentEGMenuCell
        
        
    }
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //print("did select row: \(indexPath.row)")
        
        if (indexPath.row == selectedMenuItem) {
            return
        }
        
        selectedMenuItem = indexPath.row
        
        //Present new view controller
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        switch (indexPath.row) {
        case 0:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ElkGroveSubsVC")
            break
        case 1:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ElkGroveSubsVC")
            break
        case 2:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ElkGroveSubsVC")
            break
        default:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ElkGroveSubsVC")
            break
        }
        sideMenuController()?.setContentViewController(destViewController)
    }

    
    @IBAction func toggleElkGroveMenuSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
}
