//
//  WheelingMenuPickerVC.swift
//  RammysSubContractors
//
//  Created by Michael Maczynski on 5/9/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class WheelingMenuPickerVC: UIViewController, ENSideMenuDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var WheelingMenuPickerTableView: UITableView!
    
    var WheelingMenuArray:[Menu] = [Menu]()
    var selectedMenuItem : Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
        
        view.backgroundColor = UIColor(red: 0.0, green: 64/255, blue: 128/255, alpha: 1.0)


        WheelingMenuArray.append(Menu(name: "Subs", description: ""))
        WheelingMenuArray.append(Menu(name: "Drinks", description: ""))
        WheelingMenuArray.append(Menu(name: "Salads", description: ""))
        WheelingMenuArray.append(Menu(name: "Snacks", description: ""))
        
        WheelingMenuPickerTableView.selectRowAtIndexPath(NSIndexPath(forRow: selectedMenuItem, inSection: 0), animated: false, scrollPosition: .Middle)

    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return WheelingMenuArray.count
    }
    
    /************************************/
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let currentWMenuItem = WheelingMenuArray[indexPath.row]
        let currentWMenuCell = tableView.dequeueReusableCellWithIdentifier("myWMenuCell", forIndexPath: indexPath)
        currentWMenuCell.textLabel!.text = currentWMenuItem.name
        currentWMenuCell.detailTextLabel?.text = currentWMenuItem.description
        currentWMenuCell.backgroundColor = UIColor(red: 0.0, green: 64/255, blue: 128/255, alpha: 1.0)
        currentWMenuCell.textLabel!.textColor = UIColor.whiteColor()
        currentWMenuCell.detailTextLabel!.textColor = UIColor.whiteColor()
        WheelingMenuPickerTableView.backgroundColor = UIColor(red: 0.0, green: 64/255, blue: 128/255, alpha: 1.0)
        
        
        //var image:UIImage = UIImage(named: "sub")!
        //currentCell.imageView!.image = image
        
        
        return currentWMenuCell
        
        
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
    


    
    @IBAction func toggleWheelingMenuSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
}
