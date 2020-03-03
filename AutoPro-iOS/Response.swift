//
//  Response.swift
//  AutoPro-iOS
//
//  Created by alumnos on 23/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//
import Foundation
class Response {
    
    var error_msg : String = ""
  
  
    
    init(json: [String: Any]) {
        error_msg = json["error_msg"] as? String ?? ""
        
    }
    
    
}
