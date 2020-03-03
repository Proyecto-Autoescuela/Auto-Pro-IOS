//
//  User.swift
//  AutoPro-iOS
//
//  Created by alumnos on 20/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import Foundation
class User {
    var name: String = ""
    var email: String = ""
    var password: String = ""
    var token: String = ""
    var error_msg : String = ""
    var error_code : String = ""
    
    init(json: [String: Any]) {
        email = json["email"] as? String ?? ""
        password = json["password"] as? String ?? ""
        error_msg = json["error_msg"] as? String ?? ""
    }
    
}

class PostUserResponse: Codable{
    var error_code : Int?
    var error_msg : String?
    var id : Int?
    var name : String?
    var email : String?
    var license : String?
    var number_of_students : Int?
    
    
}
