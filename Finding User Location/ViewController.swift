//
//  ViewController.swift
//  Finding User Location
//
//  Created by Mohamed Salah Zidane on 7/10/18.
//  Copyright © 2018 Mohamed Salah Zidane. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate{

    @IBOutlet var map: MKMapView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       // print(locations)
        let userLocation : CLLocation = locations[0]
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        let latDelta :CLLocationDegrees = 0.01
        let longDelta :CLLocationDegrees = 0.01
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let cordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        //let region :  MKCoordinateRegion = MKCoordinateRegion(center: cordinates, span: span)
        //map.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = cordinates
        annotation.title = "My Current Location"
        map.addAnnotation(annotation)
        
        
    }
}
