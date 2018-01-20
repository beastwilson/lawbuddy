//
//  View Controller.swift
//  Law Buddy
//
//  Created by Jacob Loukota on 1/20/18.
//  Copyright © 2018 Jacob Loukota. All rights reserved.
//

import UIKit


class ViewController: UITableViewController {
   
    let categories = ["Traffic Violation","Criminal Defense","Accidents and Injuries","Family Law","Employee Rights","Consumer Rights"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        tableView.alwaysBounceVertical = false
    }
    
    //override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //    return categories.count
   // }
    
    //override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "UITableViewCell")
        
       // let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
       // let resource = categories[indexPath.row]
        
      //  cell.textLabel?.text = resource
        
      //  return cell
   // }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        
    }
}

