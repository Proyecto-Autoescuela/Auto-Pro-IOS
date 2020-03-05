//
//  UnidadViewController.swift
//  AutoPro-iOS
//  Created by alumnos on 29/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage


class UnidadViewController: UIViewController {

   var units = Unidad()
    
    @IBOutlet weak var unidadLabel: UITextView!
    @IBOutlet weak var contentLabel: UITextView!
    var idUnitString: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        GetUnits(id: idUnitString!) {
            
            print(self.units)
            self.unidadLabel.text = self.units.name
            self.contentLabel.text = self.units.content_unit
            
        }
        
    }
    
    //Peticion de Contenido del tema
    
    func GetUnits (id : String, completed: @escaping () -> ()) {
        
        let url = URL(string: "http://localhost:8888/Api-AutoPro/public/api/unitcontent/unit/\(id)")
        
        let json = ["api_token": "24"]
        
        Alamofire.request(url!, method: .get, parameters: json, headers: nil).responseJSON { (response) in
            print(response)
            
            do {
                
                self.units = try JSONDecoder().decode(Unidad.self, from: response.data!)
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
