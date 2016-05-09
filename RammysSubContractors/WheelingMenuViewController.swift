//
//  WheelingMenuViewController.swift
//  RammysSubContractors
//
//  Created by Michael Maczynski on 5/6/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class WheelingMenuViewController: UIViewController, ENSideMenuDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var WheelingMenuButtonMenuVC: UIBarButtonItem!
    
    @IBOutlet weak var WheelingMenuTableView: UITableView!
    
    var WheelingMenuArray:[Menu] = [Menu]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
        
        WheelingMenuArray.append(Menu(name: "Turkey & Swiss", description: "Sliced Turkey Breast with Cheese"))
        WheelingMenuArray.append(Menu(name: "Roast Beef & Cheese", description: "Roast Beef, Cheddar Cheese, Bacon & Mild Horseradish sauce"))
        WheelingMenuArray.append(Menu(name: "The Hammer & Cheese", description: "Ham with Swiss or Cheddar"))
        WheelingMenuArray.append(Menu(name: "The Tri-Level", description: "Roast Beef, Turkey, Ham and Cheese a Favorite!"))
        WheelingMenuArray.append(Menu(name: "Rammy's Reuben", description: "Corned Beef, Kraut, Swiss, 1000 Island Wow!"))
        WheelingMenuArray.append(Menu(name: "Italian Beef with Provolone", description: "Ladle of au jus, Melted Cheese"))
        WheelingMenuArray.append(Menu(name: "Tuna & Provolone", description: "Fresh Tuna Salad—Delicious!"))
        WheelingMenuArray.append(Menu(name: "The Two by Four", description: "2 cheeses, 4 meats! Genoa Salami, Ham, Capicola, Pepperoni, Choice of Cheeses"))
        WheelingMenuArray.append(Menu(name: "The Lien", description: "Veggie & Cheese"))
        WheelingMenuArray.append(Menu(name: "The Wrecking Ball", description: "Meatballs, Provolone, Sauce—it will knock you out!"))
        WheelingMenuArray.append(Menu(name: "Seafood & Crab with Provolone", description: "So Good — It made #11 on the menu!"))
        WheelingMenuArray.append(Menu(name: "Rammy's BBQ", description: "Italian Beef, BBQ Sauce, Provolone, Topped off with Bacon!"))
        WheelingMenuArray.append(Menu(name: "Rammy's Radical Italian Beef", description: "Italian Beef with Pesto, Garlic Spread & Provolone"))
        WheelingMenuArray.append(Menu(name: "Skyscraper", description: "Ham, Turkey, Roast Beef, Corned Beef, Salami, Pepperoni, Capicola"))
        WheelingMenuArray.append(Menu(name: "Megastructure", description: "Ham, Turkey, Roast Beef, Corned Beef, Salami, Pepperoni, Capicola, Italian Beef, Bacon & Cheese — it’s Huge!!!!"))
        WheelingMenuArray.append(Menu(name: "BLT", description: "Crispy Bacon topped with Melted Cheese"))
        WheelingMenuArray.append(Menu(name: "Sawhorse", description: "Roast Beef, Cheddar Cheese, Bacon & Mild Horseradish Sauce"))
        WheelingMenuArray.append(Menu(name: "Ultimate Sawhorse", description: "Italian Beef, Cheddar Cheese, Bacon & Mild Horseradish Sauce"))
        WheelingMenuArray.append(Menu(name: "Classic Chicken", description: "With Provolone Cheese, Bacon & Chipotle Mayo"))
        WheelingMenuArray.append(Menu(name: "BBQ Chicken", description: "With BBQ Sauce, Bacon & Provolone Cheese"))
        WheelingMenuArray.append(Menu(name: "Parmesan Chicken", description: "With Marinara Sauce & Provolone Cheeseon Garlic Bread"))
        
        
        
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return WheelingMenuArray.count
    }
    
    /************************************/
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let currentMenuItem = WheelingMenuArray[indexPath.row]
        let currentCell = tableView.dequeueReusableCellWithIdentifier("myWCell", forIndexPath: indexPath)
        currentCell.textLabel!.text = currentMenuItem.name
        currentCell.detailTextLabel?.text = currentMenuItem.description
        
        //var image:UIImage = UIImage(named: "sub")!
        //currentCell.imageView!.image = image
        
        
        return currentCell
        
        
    }
    
    
    
    
    @IBAction func toggleMenuSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
}
