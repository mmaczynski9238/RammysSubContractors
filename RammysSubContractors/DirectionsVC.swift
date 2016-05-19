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

class DirectionsViewController: UIViewController, ENSideMenuDelegate, CLLocationManagerDelegate {
    
    var elkGroveLocation = "1022 E Higgins Rd, Elk Grove Village, IL 60007"
    var wheelingLocation = "834 Wheeling Rd, Wheeling, IL 60090"
    var wheelingPlacemark: CLPlacemark!
    let geocoder = CLGeocoder()
    var currentLocationPlacemark: CLPlacemark?
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
        findLocation(wheelingLocation)
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
    }
    @IBAction func toggleAboutSideMenu(sender: AnyObject) {
        toggleSideMenuView()}
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
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        self.mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
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
    
    @IBAction func getDirectionsBtn(sender: UIButton) {
        getDirections()
    }
    func getDirections(){
        let directionsRequest = MKDirectionsRequest()
        directionsRequest.destination = MKMapItem(placemark: MKPlacemark(placemark: wheelingPlacemark))
        
        directionsRequest.source = MKMapItem(placemark: MKPlacemark(placemark: currentLocationPlacemark!))
        let directions = MKDirections(request: directionsRequest)
        directions.calculateDirectionsWithCompletionHandler { (response, error) in
            let directions = response!.routes
            print(directions.first?.steps.first?.instructions)
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
