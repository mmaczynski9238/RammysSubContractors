//
//  AboutViewController.swift
//  RammysSubContractors
//
//  Created by Michael Maczynski on 5/4/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import MapKit

class AboutViewController: UIViewController, ENSideMenuDelegate {
    
    
    var elkGroveLocation = "1022 E Higgins Rd, Elk Grove Village, IL 60007"
    var wheelingLocation = "834 Wheeling Rd, Wheeling, IL 60090"
    
    @IBOutlet var aboutButtonMainVC: UIBarButtonItem!
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
    }
    
    @IBAction func toggleAboutSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
   
    
    func findLocation(location: String)
    {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) -> Void in
            if error != nil
            {
                print(error)
            }
            else
            {
                for placemark in placemarks!
                {
                            self.displayMap(placemark)
                }
                
                /****************************************/
                //ipad only
//                alert.popoverPresentationController!.sourceView = self.view
//                alert.popoverPresentationController!.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0,                        self.view.bounds.size.height / 2.0, 1.0, 1.0)
                
                
            }
        }
    }
    
    /****************************************/
    
    func displayMap(placemark: CLPlacemark) {
        let center = placemark.location!.coordinate
        let span = MKCoordinateSpanMake(1.0, 1.0)
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = placemark.name
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
    }
    
    
    @IBAction func segmentedControl(sender: UISegmentedControl) {
        
        switch (sender.selectedSegmentIndex)
        {
        case 0:
            findLocation(elkGroveLocation)
        case 1:
            findLocation(wheelingLocation)
        default:
            //mapView.mapType = .Standard
            
        }
}






//
//    // MARK: - ENSideMenu Delegate
//    func sideMenuWillOpen() {
//        print("sideMenuWillOpen")
//    }
//
//    func sideMenuWillClose() {
//        print("sideMenuWillClose")
//    }
//
//    func sideMenuShouldOpenSideMenu() -> Bool {
//        print("sideMenuShouldOpenSideMenu")
//        return true
//    }
//
//    func sideMenuDidClose() {
//        print("sideMenuDidClose")
//    }
//
//    func sideMenuDidOpen() {
//        print("sideMenuDidOpen")
//    }
