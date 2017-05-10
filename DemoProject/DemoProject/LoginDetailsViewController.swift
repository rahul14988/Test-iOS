//
//  LoginDetailsViewController.swift
//  DemoProject
//
//  Created by Mac Mini 1 on 10/05/17.
//  Copyright © 2017 Iolite Softwares. All rights reserved.
//

import Foundation
import UIKit
class LoginDetailsViewController : UIViewController{
    
    var rollno = 0
    var name = ""
    @IBOutlet weak var rollNoLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        rollNoLabel.text = String(rollno)
        nameLabel.text = name
    }
    
}
