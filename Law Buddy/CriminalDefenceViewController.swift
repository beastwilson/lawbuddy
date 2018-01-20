//
//  CriminalDefenceViewController.swift
//  Law Buddy
//
//  Created by Jacob Loukota on 1/20/18.
//  Copyright © 2018 Jacob Loukota. All rights reserved.
//

import UIKit


class TrafficControlView: UIViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.textView.setContentOffset(CGPoint.zero, animated: false)
    }
    
}
