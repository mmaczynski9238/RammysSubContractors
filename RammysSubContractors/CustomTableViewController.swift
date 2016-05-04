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
        
        tableView.selectRowAtIndexPath(NSIndexPath(forRow: selectedMenuItem, inSection: 0), animated: false, scrollPosition: .Middle)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL")
        var cell1 = tableView.dequeueReusableCellWithIdentifier("CELL1")
        var cell2 = tableView.dequeueReusableCellWithIdentifier("CELL2")
        var cell3 = tableView.dequeueReusableCellWithIdentifier("CELL3")



        
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
        if (cell1 == nil) {
            cell1 = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL1")
            cell1!.backgroundColor = UIColor.clearColor()
            cell1!.textLabel?.textColor = UIColor.darkGrayColor()
            let selectedBackgroundView1 = UIView(frame: CGRectMake(0, 0, cell!.frame.size.width, cell!.frame.size.height))
            selectedBackgroundView1.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
            cell1!.selectedBackgroundView = selectedBackgroundView1
            
        }
        if (cell2 == nil) {
            cell2 = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL2")
            cell2!.backgroundColor = UIColor.clearColor()
            cell2!.textLabel?.textColor = UIColor.darkGrayColor()
            let selectedBackgroundView2 = UIView(frame: CGRectMake(0, 0, cell!.frame.size.width, cell!.frame.size.height))
            selectedBackgroundView2.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
            cell2!.selectedBackgroundView = selectedBackgroundView2
            
        }
        if (cell3 == nil) {
            cell3 = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL3")
            cell!.backgroundColor = UIColor.clearColor()
            cell3!.textLabel?.textColor = UIColor.darkGrayColor()
            let selectedBackgroundView3 = UIView(frame: CGRectMake(0, 0, cell!.frame.size.width, cell!.frame.size.height))
            selectedBackgroundView3.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
            cell3!.selectedBackgroundView = selectedBackgroundView3
            
            /********* Delete Lines Below To Get Rid of Image**********/
            //            var image:UIImage = UIImage(named: "sub")!
            //            cell!.imageView!.image = image
            /*********************************************************/
        }
        



        cell!.textLabel?.text = "menu"
        cell1!.textLabel?.text = "history"
        cell2!.textLabel?.text = "elk grove"
        cell3!.textLabel?.text = "wheeling"
        
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("did select row: \(indexPath.row)")
        
        if (indexPath.row == selectedMenuItem) {
            return
        }
        
        selectedMenuItem = indexPath.row
        
        //Present new view controller
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        switch (indexPath.row) {
        case 0:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("menu")
            break
        case 1:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("history")
            break
        case 2:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("elk grove")
            break
        default:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("wheeling")
            break
        }
        sideMenuController()?.setContentViewController(destViewController)
    }
    
}


