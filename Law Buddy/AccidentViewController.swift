//
//  AccidentViewController.swift
//  Law Buddy
//
//  Created by Jacob Loukota on 1/21/18.
//  Copyright © 2018 Jacob Loukota. All rights reserved.
//

import UIKit
import SafariServices
import MapKit

class AccidentViewController: UIViewController, CLLocationManagerDelegate{
    
    let locationManager = CLLocationManager()
    let url_front = "http://lawyers.findlaw.com/lawyer/firm/"
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        locationManager.requestWhenInUseAuthorization()
    }
    
    @IBAction func viewTapped(_ sender: Any) {
        print("Button presses")
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse) {
            print("authorizes")
            let geoCoder = CLGeocoder()
            let location = locationManager.location
            
            geoCoder.reverseGeocodeLocation(location!, completionHandler: { (placemarks, error) -> Void in
                // Place details
                var placeMark: CLPlacemark!
                placeMark = placemarks?[0]
                
                var city: String
                var state: String
                
                city = placeMark.locality!
                state = placeMark.administrativeArea!
                let url_back = ((city + "/" + state).lowercased().replacingOccurrences(of: " ", with: "-"))
                let url = URL(string: self.url_front + "personal-injury-plaintiff/" + url_back)
                print(url!)
                
                let svc = SFSafariViewController(url: url!)
                self.present(svc, animated: true, completion: nil)
                
            })
        }
    }
}



