//
//  Unidad.swift
//  AutoPro-iOS
//
//  Created by alumnos on 11/02/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import Foundation

class Unidad: Codable {
    var id : Int?
    var name : String?
    var content_unit : String?
    
}

class GetUnitRS: Codable {
    
    var SUCCESS: Unit?
    
}

struct Unit: Codable {
    let name: String
    let contentUnit: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case contentUnit 
    }
}
