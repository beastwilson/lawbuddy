//
//  View Controller.swift
//  Law Buddy
//
//  Created by Jacob Loukota on 1/20/18.
//  Copyright © 2018 Jacob Loukota. All rights reserved.
//

import UIKit
import MapKit
import SafariServices

class ViewController: UITableViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let url_front = "http://lawyers.findlaw.com/lawyer/firm/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        tableView.alwaysBounceVertical = false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func getCityState() -> String {
        print("Button tapped")
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        var city = ""
        var state = ""
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse) {
            
            let geoCoder = CLGeocoder()
            let location = locationManager.location
            
            geoCoder.reverseGeocodeLocation(location!, completionHandler: { (placemarks, error) -> Void in
                // Place details
                var placeMark: CLPlacemark!
                placeMark = placemarks?[0]
                
                city = placeMark.locality!
                state = placeMark.administrativeArea!
            })
        }
        return formatPlace(city) + "/" + formatPlace(state)
    }
    
    func formatPlace(_ place : String) -> String {
        return place.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    func openURL () {
        let url = URL(string: url_front + "family-law/" + getCityState())
        let svc = SFSafariViewController(url: url!)
        present(svc, animated: true, completion: nil)
    }
}
