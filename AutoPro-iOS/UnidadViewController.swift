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

var units = Unidad()

class UnidadViewController: UIViewController {
    
    @IBOutlet weak var unidadLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    var idUnitString: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        GetUnits {
            
            print(units)
            self.unidadLabel.text = units.name
            self.contentLabel.text = units.content_unit
            
        }
        
    }
    
    //Peticion de Contenido del tema
    
    func GetUnits (completed: @escaping () -> ()) {
        
        let url = URL(string: "http://localhost:8888/autopro/AutoPro-API-features-migrations/public/api/unitcontent/unit/\(idUnitString)")
        
        let json = ["api_token": "24"]
        
        Alamofire.request(url!, method: .get, parameters: json, headers: nil).responseJSON { (response) in
            print(response)
            
            do {
                
                units = try JSONDecoder().decode(Unidad.self, from: response.data!)
                DispatchQueue.main.async{
                    completed()
                    
                }
                
            }catch {
                print(error)
                
            }
            }.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
