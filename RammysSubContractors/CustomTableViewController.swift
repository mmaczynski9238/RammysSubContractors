//
//  CustomTableViewController.swift
//  RammysSubContractors
//
//  Created by Michael Maczynski on 5/3/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//
import UIKit

class CustomTableViewController: UITableViewController {

    var selectedMenuItem : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        
        // Customize apperance of table view
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0) //
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.clearColor()
        tableView.scrollsToTop = false
        
        // Preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        //tableView.selectRowAtIndexPath(NSIndexPath(forRow: selectedMenuItem, inSection: 0), animated: false, scrollPosition: .Middle)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL")
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL")
            cell!.backgroundColor = UIColor.clearColor()
            cell!.textLabel?.textColor = UIColor.darkGrayColor()
            let selectedBackgroundView = UIView(frame: CGRectMake(0, 0, cell!.frame.size.width, cell!.frame.size.height))
            selectedBackgroundView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
            cell!.selectedBackgroundView = selectedBackgroundView
            
            /********* Delete Lines Below To Get Rid of Image**********/
            //            var image:UIImage = UIImage(named: "sub")!
            //            cell!.imageView!.image = image
            /*********************************************************/
        }
        
        if indexPath.row == 0
        {
            cell!.textLabel?.text = "Main"
            
        }
        else if indexPath.row == 1
        {
            cell!.textLabel?.text = "Elk Grove Menu"
            
        }
            
        else if indexPath.row == 2
        {
            cell!.textLabel?.text = "Wheeling Menu"
            
        }
        else if indexPath.row == 3
        {
            cell!.textLabel?.text = "Directions"
            
        }
        else if indexPath.row == 4
        {
            cell!.textLabel?.text = "About"
            
        }
        
        cell?.textLabel?.textColor = UIColor(red: 0.0, green: 64/255, blue: 128/255, alpha: 1.0)
        cell?.textLabel?.font = UIFont(name: "Arial Hebrew", size: 17)
        
        //cell!.textLabel?.text = "ViewController #\(indexPath.row+1)"
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainMenu")
            break
        case 1:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ElkGroveMenuPickerVC")
            break
        case 2:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("WheelingMenuPickerVC")
            break
        case 3:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ViewController4")
            break
        case 4:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("AboutViewController")
            break
        default:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainMenu")
            break
        }
        sideMenuController()?.setContentViewController(destViewController)
    }
    
}


