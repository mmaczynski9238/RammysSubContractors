//
//  WheelingMenuPickerVC.swift
//  RammysSubContractors
//
//  Created by Michael Maczynski on 5/9/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class WheelingMenuPickerVC: UIViewController, ENSideMenuDelegate, UITableViewDelegate, UITableViewDataSource, SMSegmentViewDelegate {
    
    @IBOutlet weak var segmentedController: UISegmentedControl!
    
    @IBOutlet var WheelingMenuPickerTableView: UITableView!
        
        var segmentView: SMSegmentView!
        
        @IBOutlet var ElkGroveMenuPickerTableView: UITableView!
        
        var WheelingSubsMenuArray:[Menu] = [Menu]()
        var WheelingSidesMenuArray:[Menu] = [Menu]()
        var WheelingDrinksMenuArray:[Menu] = [Menu]()
        
        var selectedMenuItem : Int = 0
        var currentIndex = 0
        
        
        var isOpen = false
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.sideMenuController()?.sideMenu?.delegate = self
            
            initSubs()
            initDrinks()
            initSides()
            createSegmentView()
            
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
            swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
            self.view.addGestureRecognizer(swipeLeft)
            initializeGestureRecognizer()

            
//            ElkGroveMenuPickerTableView.selectRowAtIndexPath(NSIndexPath(forRow: selectedMenuItem, inSection: 0), animated: false, scrollPosition: .Middle)
        }
        
        
        
        
        func createSegmentView()
        {
            let segmentFrame = CGRect(x: 10.0, y: 613.0, width: 355, height: 50.0)
            self.segmentView = SMSegmentView(frame: segmentFrame, separatorColour: UIColor(white: 0.95, alpha: 0.3), separatorWidth: 0.5, segmentProperties: [keySegmentTitleFont: UIFont.systemFontOfSize(12.0), keySegmentOnSelectionColour: UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0/*red: 0, green: 97.0/255.0, blue: 191.0/255.0*/, alpha: 1.0), keySegmentOffSelectionColour: UIColor.whiteColor(), keyContentVerticalMargin: Float(10.0)])
            segmentView.segmentOnSelectionTextColour = UIColor.darkGrayColor()
            self.segmentView.delegate = self
            self.segmentView.backgroundColor = UIColor.clearColor()
            self.segmentView.layer.cornerRadius = 5.0
            self.segmentView.layer.borderColor = UIColor(white: 0.85, alpha: 1.0).CGColor
            self.segmentView.layer.borderWidth = 1.0
            let view = self.segmentView
            view.addSegmentWithTitle("Subs", onSelectionImage: UIImage(named: "clip_light"), offSelectionImage: UIImage(named: "clip"))
            view.addSegmentWithTitle("Sides", onSelectionImage: UIImage(named: "bulb_light"), offSelectionImage: UIImage(named: "bulb"))
            view.addSegmentWithTitle("Drinks", onSelectionImage: UIImage(named: "cloud_light"), offSelectionImage: UIImage(named: "cloud"))
            // Set segment with index 0 as selected by default
            //segmentView.selectSegmentAtIndex(0)
            self.view.addSubview(view)
        }
        
        func segmentView(segmentView: SMBasicSegmentView, didSelectSegmentAtIndex index: Int) {
            currentIndex = index
            WheelingMenuPickerTableView.reloadData()
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            if currentIndex == 0{
                
                return WheelingSubsMenuArray.count
            }
            else if currentIndex == 1{
                
                return WheelingSidesMenuArray.count
            }
            else{
                return WheelingDrinksMenuArray.count
            }
        }
        
        func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
        {
            let header = view as! UITableViewHeaderFooterView
            header.textLabel?.font = UIFont(name: "Roboto", size: 38)!
            header.textLabel?.textColor = UIColor.lightGrayColor()
        }
        
        
        
        /************************************/
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            let currentEGMenuCell = tableView.dequeueReusableCellWithIdentifier("myWMenuCell", forIndexPath: indexPath)
            
            if currentIndex == 0 {//currentIndex == 0{
                let currentWheelingMenuItem = WheelingSubsMenuArray[indexPath.row]
                currentEGMenuCell.textLabel!.text = currentWheelingMenuItem.name
                currentEGMenuCell.detailTextLabel?.text = currentWheelingMenuItem.description
            }
            if currentIndex == 1{
                let currentWheelingMenuItem = WheelingSidesMenuArray[indexPath.row]
                currentEGMenuCell.textLabel!.text = currentWheelingMenuItem.name
                currentEGMenuCell.detailTextLabel?.text = currentWheelingMenuItem.description
            }
            if currentIndex == 2{
                let currentWheelingMenuItem = WheelingDrinksMenuArray[indexPath.row]
                currentEGMenuCell.textLabel!.text = currentWheelingMenuItem.name
                currentEGMenuCell.detailTextLabel?.text = currentWheelingMenuItem.description
            }
            return currentEGMenuCell
        }
        
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
            if (indexPath.row == selectedMenuItem) {
                return
            }
            selectedMenuItem = indexPath.row
            
        }
        
        
        
        
        func initSubs(){
            WheelingSubsMenuArray.append(Menu(name: "Turkey & Swiss", description: "Sliced Turkey Breast with Cheese"))
            WheelingSubsMenuArray.append(Menu(name: "Roast Beef & Cheese", description: "Roast Beef, Cheddar Cheese, Bacon & Mild Horseradish sauce"))
            WheelingSubsMenuArray.append(Menu(name: "The Hammer & Cheese", description: "Ham with Swiss or Cheddar"))
            WheelingSubsMenuArray.append(Menu(name: "The Tri-Level", description: "Roast Beef, Turkey, Ham and Cheese a Favorite!"))
            WheelingSubsMenuArray.append(Menu(name: "Rammy's Reuben", description: "Corned Beef, Kraut, Swiss, 1000 Island Wow!"))
            WheelingSubsMenuArray.append(Menu(name: "Double Decker Reuben", description: "Corned Beef, Kraut, Swiss, 1000 Island Wow!"))
            WheelingSubsMenuArray.append(Menu(name: "Italian Beef with Provolone", description: "Ladle of au jus, Melted Cheese"))
            WheelingSubsMenuArray.append(Menu(name: "Tuna & Provolone", description: "Fresh Tuna Salad—Delicious!"))
            WheelingSubsMenuArray.append(Menu(name: "The Two by Four", description: "2 cheeses, 4 meats! Genoa Salami, Ham, Capicola, Pepperoni, Choice of Cheeses"))
            WheelingSubsMenuArray.append(Menu(name: "The Lien", description: "Veggie & Cheese"))
            WheelingSubsMenuArray.append(Menu(name: "The Wrecking Ball", description: "Meatballs, Provolone, Sauce — It will knock you out!"))
            WheelingSubsMenuArray.append(Menu(name: "Seafood & Crab with Provolone", description: "So Good — It made #1 on the menu!"))
            WheelingSubsMenuArray.append(Menu(name: "Rammy's BBQ", description: "Italian Beef, BBQ Sauce, Provolone, Topped off with Bacon!"))
            WheelingSubsMenuArray.append(Menu(name: "Rammy's Radical Italian Beef", description: "Italian Beef with Pesto, Garlic Spread & Provolone"))
            WheelingSubsMenuArray.append(Menu(name: "Skyscraper", description: "Ham, Turkey, Roast Beef, Corned Beef, Salami, Pepperoni, Capicola"))
            WheelingSubsMenuArray.append(Menu(name: "Megastructure", description: "Ham, Turkey, Roast Beef, Corned Beef, Salami, Pepperoni, Capicola, Italian Beef, Bacon & Cheese — it’s Huge!"))
            WheelingSubsMenuArray.append(Menu(name: "BLT", description: "Crispy Bacon topped with Melted Cheese"))
            WheelingSubsMenuArray.append(Menu(name: "Sawhorse", description: "Roast Beef, Cheddar Cheese, Bacon & Mild Horseradish Sauce"))
            WheelingSubsMenuArray.append(Menu(name: "Ultimate Sawhorse", description: "Italian Beef, Cheddar Cheese, Bacon & Mild Horseradish Sauce"))
            WheelingSubsMenuArray.append(Menu(name: "Classic Chicken", description: "With Provolone Cheese, Bacon & Chipotle Mayo"))
            WheelingSubsMenuArray.append(Menu(name: "BBQ Chicken", description: "With BBQ Sauce, Bacon & Provolone Cheese"))
            WheelingSubsMenuArray.append(Menu(name: "Parmesan Chicken", description: "With Marinara Sauce & Provolone Cheeseon Garlic Bread"))
            WheelingSubsMenuArray.append(Menu(name: "The New Yorker", description: "Slow Roasdted Roast Beef, Swiss, Lettuce, Tomato, Onions, Seasonings and Rosemary Aioli on a Pretzel Roll"))

        }
        func initSides(){
            WheelingSidesMenuArray.append(Menu(name: "Fantastic Brownies", description: ""))
            WheelingSidesMenuArray.append(Menu(name: "Potato Salad", description: ""))
            WheelingSidesMenuArray.append(Menu(name: "Cole Slaw", description: ""))
            WheelingSidesMenuArray.append(Menu(name: "Cheddar Macaroni Salad", description: ""))
            WheelingSidesMenuArray.append(Menu(name: "Chips", description: ""))
            WheelingSidesMenuArray.append(Menu(name: "Delicious Cookies", description: ""))
        }
        
        func initDrinks(){
            WheelingDrinksMenuArray.append(Menu(name: "Arizona Teas", description: ""))
            WheelingDrinksMenuArray.append(Menu(name: "Gatorade", description: ""))
            WheelingDrinksMenuArray.append(Menu(name: "Can of Soda", description: ""))
            WheelingDrinksMenuArray.append(Menu(name: "Large Founatain Drink", description: ""))
            WheelingDrinksMenuArray.append(Menu(name: "Medium Fountain Drink", description: ""))
            WheelingDrinksMenuArray.append(Menu(name: "Banana Shakes", description: ""))
            WheelingDrinksMenuArray.append(Menu(name: "Strawberry Shakes", description: ""))
            WheelingDrinksMenuArray.append(Menu(name: "Chocolate Shakes", description: ""))
            WheelingDrinksMenuArray.append(Menu(name: "Vanilla Shakes", description: ""))
        }
        
        
        
        @IBAction func Subs(sender: UIButton) {
            
        }
        @IBAction func Sides(sender: UIButton) {
        }
        @IBAction func Drinks(sender: UIButton) {
        }
        
    @IBAction func toggleWheelingSideMenu(sender: AnyObject) {
        toggleSideMenuView()

    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                if isOpen == true
                {
                    toggleSideMenuView()
                }
            default:
                break
            }
        }
    }
    
    func initializeGestureRecognizer()
    {
//        var tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("recognizeTapGesture:"))
//        view.addGestureRecognizer(tapGesture)
//    }
//    func recognizeTapGesture(sender: UIGestureRecognizer) {
//        if isOpen == true {
//            toggleSideMenuView()
//        }
    }
    
    
    func sideMenuDidClose() {
        isOpen = false
    }
    func sideMenuDidOpen() {
        isOpen = true
    }
    

}
