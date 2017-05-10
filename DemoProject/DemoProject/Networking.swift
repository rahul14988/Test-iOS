//
//  Networking.swift
//  DemoProject
//
//  Created by Mac Mini 1 on 10/05/17.
//  Copyright © 2017 Iolite Softwares. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftOverlays

class Networking{
    
    
    static func stringByRemovingControlCharacters(string: String) -> String {
        let controlChars = NSCharacterSet.controlCharacters
        var range = string.rangeOfCharacter(from: controlChars)
        var mutable = string
        while let removeRange = range {
            mutable.removeSubrange(removeRange)
            range = mutable.rangeOfCharacter(from: controlChars)
        }
        
        return mutable
    }
    
    static func getJSONData(_ url:String,parameters:[String:String],sender:Callback) -> Void {
        
        print(url+"?")
        for param in parameters {
            print(param.0+"="+param.1+"&")
        }
        
        
        Alamofire.request(url,method : .post,parameters: parameters)
            .responseString(completionHandler: {
                response in
                if let result = response.result.value{
                    let string = stringByRemovingControlCharacters(string: result)
                    print("String :",string)
                    let json = JSON.parse(string)
                    sender.getData(json)
                }else{
                    print("response nil")
                    SwiftOverlays.removeAllBlockingOverlays()
                    
                    
                }
                
            })
        
    }
    
    
    static func getJSONData(_ url:String,parameters:[String:String],getData: @escaping (_ data:JSON)-> Void) -> Void{
        
        print(url+"?")
        for param in parameters {
            print(param.0+"="+param.1+"&")
        }
        
        Alamofire.request(url,method : .post,parameters: parameters)
            .responseString(completionHandler: {
                response in
                if let result = response.result.value{
                    let string = stringByRemovingControlCharacters(string: result)
                    print("String :",string)
                    let json = JSON.parse(string)
                    getData(json)
                }else{
                    print("response nil")
                    SwiftOverlays.removeAllBlockingOverlays()
                    
                }
                
            })
    }
    
}

