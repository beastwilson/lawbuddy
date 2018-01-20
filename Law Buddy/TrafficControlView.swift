//
//  TrafficControlView.swift
//  Law Buddy
//
//  Created by Jacob Loukota on 1/20/18.
//  Copyright © 2018 Jacob Loukota. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UITableViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        tableView.alwaysBounceVertical = false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func getCity() -> String {
        print("Button tapped")
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        var city = ""
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse) {
            
            let geoCoder = CLGeocoder()
            let location = locationManager.location
            
            geoCoder.reverseGeocodeLocation(location!, completionHandler: { (placemarks, error) -> Void in
                // Place details
                var placeMark: CLPlacemark!
                placeMark = placemarks?[0]
                
                city = placeMark.locality!
            })
        }
        return formatCity(city)
    }
    
    func formatCity(_ city : String) -> String {
        return city.lowercased().replacingOccurrences(of: " ", with: "-")
    }
}
