//
//  ViewController.swift
//  DemoProject
//
//  Created by Mac Mini 1 on 10/05/17.
//  Copyright © 2017 Iolite Softwares. All rights reserved.
//

import UIKit
import SwiftOverlays
import SwiftyJSON

class ViewController: UIViewController,Callback{

    
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var parameters : [String : String] = [:]
    var rollno = 0
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let username : String = usernameTextField.text!
        let password : String = passwordTextField.text!
        parameters["username"] = username
        parameters["password"] = password
        if(Reachability.isConnectedToNetwork())
        {
            SwiftOverlays.showBlockingWaitOverlayWithText("Please Wait....")
            Networking.getJSONData("http://grandeurinfotech.com/mobile/document.json", parameters: parameters,sender: self)
        }
        
    }
    
        
    func getData(_ data: JSON) {
        print(data)
        if(data["login"].stringValue == "Success")
        {
        let details = data["details"]
         rollno = details["rollno"].intValue
        name = details["name"].stringValue
        }
        print(rollno)
        SwiftOverlays.removeAllBlockingOverlays()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segue_loginClicked"){
            let navigationController = segue.destination as! UIViewController
            let viewController = navigationController as! LoginDetailsViewController
            
            
            viewController.rollno = rollno
            viewController.name = name
        }


}
}

