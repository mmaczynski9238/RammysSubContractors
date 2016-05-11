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
        
        ElkGroveMenuArray.append(Menu(name: "Turkey & Swiss", description: "Sliced Turkey Breast with Cheese"))
        ElkGroveMenuArray.append(Menu(name: "Roast Beef & Cheese", description: "Roast Beef, Cheddar Cheese, Bacon & Mild Horseradish sauce"))
        ElkGroveMenuArray.append(Menu(name: "The Hammer & Cheese", description: "Ham with Swiss or Cheddar"))
        ElkGroveMenuArray.append(Menu(name: "The Tri-Level", description: "Roast Beef, Turkey, Ham and Cheese a Favorite!"))
        ElkGroveMenuArray.append(Menu(name: "Rammy's Reuben", description: "Corned Beef, Kraut, Swiss, 1000 Island Wow!"))
        ElkGroveMenuArray.append(Menu(name: "Italian Beef with Provolone", description: "Ladle of au jus, Melted Cheese"))
        ElkGroveMenuArray.append(Menu(name: "Tuna & Provolone", description: "Fresh Tuna Salad—Delicious!"))
        ElkGroveMenuArray.append(Menu(name: "The Two by Four", description: "2 cheeses, 4 meats! Genoa Salami, Ham, Capicola, Pepperoni, Choice of Cheeses"))
        ElkGroveMenuArray.append(Menu(name: "The Lien", description: "Veggie & Cheese"))
        ElkGroveMenuArray.append(Menu(name: "The Wrecking Ball", description: "Meatballs, Provolone, Sauce—it will knock you out!"))
        ElkGroveMenuArray.append(Menu(name: "Seafood & Crab with Provolone", description: "So Good — It made #11 on the menu!"))
        ElkGroveMenuArray.append(Menu(name: "Rammy's BBQ", description: "Italian Beef, BBQ Sauce, Provolone, Topped off with Bacon!"))
        ElkGroveMenuArray.append(Menu(name: "Rammy's Radical Italian Beef", description: "Italian Beef with Pesto, Garlic Spread & Provolone"))
        ElkGroveMenuArray.append(Menu(name: "Skyscraper", description: "Ham, Turkey, Roast Beef, Corned Beef, Salami, Pepperoni, Capicola"))
        ElkGroveMenuArray.append(Menu(name: "Megastructure", description: "Ham, Turkey, Roast Beef, Corned Beef, Salami, Pepperoni, Capicola, Italian Beef, Bacon & Cheese — it’s Huge!!!!"))
        ElkGroveMenuArray.append(Menu(name: "BLT", description: "Crispy Bacon topped with Melted Cheese"))
        ElkGroveMenuArray.append(Menu(name: "Sawhorse", description: "Roast Beef, Cheddar Cheese, Bacon & Mild Horseradish Sauce"))
        ElkGroveMenuArray.append(Menu(name: "Ultimate Sawhorse", description: "Italian Beef, Cheddar Cheese, Bacon & Mild Horseradish Sauce"))
        ElkGroveMenuArray.append(Menu(name: "Classic Chicken", description: "With Provolone Cheese, Bacon & Chipotle Mayo"))
        ElkGroveMenuArray.append(Menu(name: "BBQ Chicken", description: "With BBQ Sauce, Bacon & Provolone Cheese"))
        ElkGroveMenuArray.append(Menu(name: "Parmesan Chicken", description: "With Marinara Sauce & Provolone Cheeseon Garlic Bread"))
        
        
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
