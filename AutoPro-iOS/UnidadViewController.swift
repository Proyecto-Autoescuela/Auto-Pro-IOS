//
//  UnidadViewController.swift
//  AutoPro-iOS
//
//  Created by alumnos on 29/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage



class UnidadViewController: UIViewController {
    
    @IBOutlet weak var unidadLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    var idUnitString: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        Network.GetContent(id: idUnitString!) {
            
            self.unidadLabel.text = Network.unit.name
            self.contentLabel.text = Network.unit.content_unit
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
