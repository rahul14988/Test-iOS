//
//  Callback.swift
//  DemoProject
//
//  Created by Mac Mini 1 on 10/05/17.
//  Copyright © 2017 Iolite Softwares. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol Callback{
    
    func getData(_ data:JSON)->Void
    
}
