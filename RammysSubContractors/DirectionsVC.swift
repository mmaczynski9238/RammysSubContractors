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

class DirectionsViewController: UIViewController, ENSideMenuDelegate, CLLocationManagerDelegate,UITableViewDelegate, UITableViewDataSource,MKMapViewDelegate {
    
    
    @IBOutlet weak var segmentConroller: UISegmentedControl!
    @IBOutlet weak var DTableView: UITableView!
    @IBOutlet weak var GDirections: UIButton!
    
    
    var elkGroveLocation = "1022 E Higgins Rd, Elk Grove Village, IL 60007"
    var wheelingLocation = "834 Wheeling Rd, Wheeling, IL 60090"
    var wheelingPlacemark: CLPlacemark!
    var EGPlacemark: CLPlacemark!
    let geocoder = CLGeocoder()
    var currentLocationPlacemark: CLPlacemark?
    var directions = [MKRoute]()
    var instructions = [String]()
    
    
    var isOpen = false
    var counter = 0
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var distance: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.mapView.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
        findLocation(wheelingLocation)
        
        self.sideMenuController()?.sideMenu?.delegate = self
        
       disableBtn()
        
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
                    self.disableBtn()
                }
            }
        }
        

    }
    func disableBtn(){
        if currentLocationPlacemark == nil{
            GDirections.enabled = false
        }
        else {
            GDirections.enabled = true
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
                    if self.segmentConroller.selectedSegmentIndex == 1{
                        self.EGPlacemark = placemark
                    }
                    
                }
                
                
            }
        }
    }
    func instructionFunction(){
        instructions.append(self.directions.first!.steps[0].instructions)

    }
    
    @IBAction func getDirectionsBtn(sender: UIButton) {
        counter++
        getDirections()
        if counter == 2{
            GDirections.enabled = false
        }
        //print(instructions)
    }
    func getDirections(){
        DTableView.reloadData()

        let directionsRequest = MKDirectionsRequest()
        directionsRequest.destination = MKMapItem(placemark: MKPlacemark(placemark: wheelingPlacemark))
       
        //print(currentLocationPlacemark)

        directionsRequest.source = MKMapItem(placemark: MKPlacemark(placemark: currentLocationPlacemark!))
        let directions1 = MKDirections(request: directionsRequest)
        
        directions1.calculateDirectionsWithCompletionHandler { (response, error) in
            self.directions = response!.routes
            self.showRoute(self.directions)
            for step in (self.directions.first?.steps)!
            {
                self.instructions.append(step.instructions)

            }
            //print(self.directions.first!.steps[0].instructions)
            self.DTableView.reloadData()
            //print(self.instructions)
            self.distance.text = String(self.directions.first?.distance)
        
            }
    }
    
    func plotPolyline(route: MKRoute) {
        mapView.addOverlay(route.polyline)
        if mapView.overlays.count == 1 {
            mapView.setVisibleMapRect(route.polyline.boundingMapRect,
                                      edgePadding: UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0),
                                      animated: false)
        }
        else {
            let polylineBoundingRect =  MKMapRectUnion(mapView.visibleMapRect,
                                                       route.polyline.boundingMapRect)
            mapView.setVisibleMapRect(polylineBoundingRect,
                                      edgePadding: UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0),
                                      animated: false)
        }
    }
    
    func mapView(mapView: MKMapView,
                 rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        
        let polylineRenderer = MKPolylineRenderer(overlay: overlay)
        if (overlay is MKPolyline) {
            if mapView.overlays.count == 1 {
                polylineRenderer.strokeColor =
                    UIColor.blueColor().colorWithAlphaComponent(0.75)
                        polylineRenderer.lineWidth = 5
            }
        }
        return polylineRenderer
    }
    func showRoute(routes: [MKRoute]) {
        for i in 0..<routes.count {
            plotPolyline(routes[i])
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
        default: break
            
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
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customcell", forIndexPath: indexPath) 
        cell.textLabel?.text = instructions[indexPath.item]
        return cell
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
