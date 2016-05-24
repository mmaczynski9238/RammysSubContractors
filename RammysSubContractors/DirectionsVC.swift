//
//  DirectionsViewController.swift
//  RammysSubContractors
//
//  Created by Michael Maczynski on 5/4/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DirectionsViewController: UIViewController, ENSideMenuDelegate, CLLocationManagerDelegate,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var DirectionsTableView: UITableView!
    
    var elkGroveLocation = "1022 E Higgins Rd, Elk Grove Village, IL 60007"
    var wheelingLocation = "834 Wheeling Rd, Wheeling, IL 60090"
    var wheelingPlacemark: CLPlacemark!
    let geocoder = CLGeocoder()
    var currentLocationPlacemark: CLPlacemark?
    var directions = [MKRoute]()
    var instructions = [String]()
    
    
    var isOpen = false
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var tableView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
        findLocation(wheelingLocation)
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
    }
    @IBAction func toggleAboutSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    /*********************/
    @IBAction func getLocation(sender: UIButton) {
        self.locationManager.startUpdatingLocation()
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let location = locations.last
        
        CLGeocoder().reverseGeocodeLocation(location!) { (placemarks, error) in
            if error != nil {
                print(error)
            }
            else {
                for placemark in placemarks! {
                    self.currentLocationPlacemark = placemark
                }
            }
        }
        

    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        print("Error: " + error.localizedDescription)
    }
    
    /*********************/
    func findLocation(location: String)
    {
        geocoder.geocodeAddressString(location) { (placemarks, error) -> Void in
            if error != nil {
                print(error)
            }
            else {
                for placemark in placemarks! {
                    self.displayMap(placemark)
                    self.wheelingPlacemark = placemark
                    
                }
                
                
            }
        }
    }
    func insturctionFunction(){
        instructions.append(self.directions.first!.steps[0].instructions)

    }
    
    @IBAction func getDirectionsBtn(sender: UIButton) {
        getDirections()
    }
    func getDirections(){
        
        let directionsRequest = MKDirectionsRequest()
        directionsRequest.destination = MKMapItem(placemark: MKPlacemark(placemark: wheelingPlacemark))
        //print(currentLocationPlacemark)
        directionsRequest.source = MKMapItem(placemark: MKPlacemark(placemark: currentLocationPlacemark!))
        let directions1 = MKDirections(request: directionsRequest)
        directions1.calculateDirectionsWithCompletionHandler { (response, error) in
            self.directions = response!.routes
            for step in (self.directions.first?.steps)!
            {
                print(step.instructions)
            }
            //print(self.directions.first!.steps[0].instructions)

            self.distance.text = String(self.directions.first?.distance)
            
        }
        
    }
    /****************************************/
    
    func displayMap(placemark: CLPlacemark) {
        let center = placemark.location!.coordinate
        let span = MKCoordinateSpanMake(0.3, 0.3)
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
            findLocation(wheelingLocation)
        case 1:
            findLocation(elkGroveLocation)
        default:
            findLocation(wheelingLocation)
        }
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
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return instructions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let currentDMenuCell = tableView.dequeueReusableCellWithIdentifier("DCell", forIndexPath: indexPath)
        
        
        let currentDMenuItem = instructions[indexPath.row]
                    currentDMenuCell.textLabel?.text = instructions[indexPath.row]
        tableView.reloadData()
        print(instructions)
        return currentDMenuCell
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
    
    
    
}
