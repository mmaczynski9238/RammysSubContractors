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
    var ElkGroveSubsMenuArray:[Menu] = [Menu]()
    var ElkGroveSidesMenuArray:[Menu] = [Menu]()
    var ElkGroveDrinksMenuArray:[Menu] = [Menu]()
    
    var selectedMenuItem : Int = 0
    
    @IBOutlet weak var ElkGroveSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
        ElkGroveSegment.selectedSegmentIndex = 0
        Subs()
        drinks()
        sides()
        
        
        ElkGroveMenuPickerTableView.selectRowAtIndexPath(NSIndexPath(forRow: selectedMenuItem, inSection: 0), animated: false, scrollPosition: .Middle)
        
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if ElkGroveSegment.selectedSegmentIndex == 0{
            
            return ElkGroveSubsMenuArray.count
        }
        else if ElkGroveSegment.selectedSegmentIndex == 1{
            
            return ElkGroveSidesMenuArray.count
        }
        else{
            
            return ElkGroveDrinksMenuArray.count
        }
    }
    
    /************************************/
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let currentEGMenuCell = tableView.dequeueReusableCellWithIdentifier("myEGMenuCell", forIndexPath: indexPath)
        
        if ElkGroveSegment.selectedSegmentIndex == 0{
            let currentEGMenuItem = ElkGroveSubsMenuArray[indexPath.row]
            currentEGMenuCell.textLabel!.text = currentEGMenuItem.name
            currentEGMenuCell.detailTextLabel?.text = currentEGMenuItem.description
            
        }
        if ElkGroveSegment.selectedSegmentIndex == 1{
            let currentEGMenuItem = ElkGroveSidesMenuArray[indexPath.row]
            currentEGMenuCell.textLabel!.text = currentEGMenuItem.name
            currentEGMenuCell.detailTextLabel?.text = currentEGMenuItem.description
            
        }
        if ElkGroveSegment.selectedSegmentIndex == 2{
            let currentEGMenuItem = ElkGroveDrinksMenuArray[indexPath.row]
            currentEGMenuCell.textLabel!.text = currentEGMenuItem.name
            currentEGMenuCell.detailTextLabel?.text = currentEGMenuItem.description
            
        }
        
        return currentEGMenuCell
        
        //var image:UIImage = UIImage(named: "sub")!
        //currentCell.imageView!.image = image
        
        
        
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
    func Subs(){
        ElkGroveSubsMenuArray.append(Menu(name: "Turkey & Swiss", description: "Sliced Turkey Breast with Cheese"))
        ElkGroveSubsMenuArray.append(Menu(name: "Roast Beef & Cheese", description: "Roast Beef, Cheddar Cheese, Bacon & Mild Horseradish sauce"))
        ElkGroveSubsMenuArray.append(Menu(name: "The Hammer & Cheese", description: "Ham with Swiss or Cheddar"))
        ElkGroveSubsMenuArray.append(Menu(name: "The Tri-Level", description: "Roast Beef, Turkey, Ham and Cheese a Favorite!"))
        ElkGroveSubsMenuArray.append(Menu(name: "Rammy's Reuben", description: "Corned Beef, Kraut, Swiss, 1000 Island Wow!"))
        ElkGroveSubsMenuArray.append(Menu(name: "Italian Beef with Provolone", description: "Ladle of au jus, Melted Cheese"))
        ElkGroveSubsMenuArray.append(Menu(name: "Tuna & Provolone", description: "Fresh Tuna Salad—Delicious!"))
        ElkGroveSubsMenuArray.append(Menu(name: "The Two by Four", description: "2 cheeses, 4 meats! Genoa Salami, Ham, Capicola, Pepperoni, Choice of Cheeses"))
        ElkGroveSubsMenuArray.append(Menu(name: "The Lien", description: "Veggie & Cheese"))
        ElkGroveSubsMenuArray.append(Menu(name: "The Wrecking Ball", description: "Meatballs, Provolone, Sauce—it will knock you out!"))
        ElkGroveSubsMenuArray.append(Menu(name: "Seafood & Crab with Provolone", description: "So Good — It made #11 on the menu!"))
        ElkGroveSubsMenuArray.append(Menu(name: "Rammy's BBQ", description: "Italian Beef, BBQ Sauce, Provolone, Topped off with Bacon!"))
        ElkGroveSubsMenuArray.append(Menu(name: "Rammy's Radical Italian Beef", description: "Italian Beef with Pesto, Garlic Spread & Provolone"))
        ElkGroveSubsMenuArray.append(Menu(name: "Skyscraper", description: "Ham, Turkey, Roast Beef, Corned Beef, Salami, Pepperoni, Capicola"))
        ElkGroveSubsMenuArray.append(Menu(name: "Megastructure", description: "Ham, Turkey, Roast Beef, Corned Beef, Salami, Pepperoni, Capicola, Italian Beef, Bacon & Cheese — it’s Huge!!!!"))
        ElkGroveSubsMenuArray.append(Menu(name: "BLT", description: "Crispy Bacon topped with Melted Cheese"))
        ElkGroveSubsMenuArray.append(Menu(name: "Sawhorse", description: "Roast Beef, Cheddar Cheese, Bacon & Mild Horseradish Sauce"))
        ElkGroveSubsMenuArray.append(Menu(name: "Ultimate Sawhorse", description: "Italian Beef, Cheddar Cheese, Bacon & Mild Horseradish Sauce"))
        ElkGroveSubsMenuArray.append(Menu(name: "Classic Chicken", description: "With Provolone Cheese, Bacon & Chipotle Mayo"))
        ElkGroveSubsMenuArray.append(Menu(name: "BBQ Chicken", description: "With BBQ Sauce, Bacon & Provolone Cheese"))
        ElkGroveSubsMenuArray.append(Menu(name: "Parmesan Chicken", description: "With Marinara Sauce & Provolone Cheeseon Garlic Bread"))
    }
    func sides(){
        ElkGroveSidesMenuArray.append(Menu(name: "Chocolate Brownie", description: "Delicious"))
        
    }
    
    func drinks(){
        ElkGroveDrinksMenuArray.append(Menu(name: "Arizona Ice Tea", description: "Refreshing"))
    }
    @IBAction func EGsegmentedAction(sender: UISegmentedControl) {
        ElkGroveMenuPickerTableView.reloadData()
    }
    
    @IBAction func Subs(sender: UIButton) {
        
    }
    @IBAction func Sides(sender: UIButton) {
    }
    @IBAction func Drinks(sender: UIButton) {
    }
    
    
    @IBAction func toggleElkGroveMenuSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
}