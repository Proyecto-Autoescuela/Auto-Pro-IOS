//
//  ListarUnidadesViewController.swift
//  
//
//  Created by alumnos on 12/02/2020.
//

import UIKit
import Alamofire
import SDWebImage

var idUnit:Int?
var units = [Unidades]()

class ListarUnidadesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableView: UITableView!
    
//    var units = [Unidades]()
    
    var idString: String?
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        super.viewWillAppear(true)
        // Do any additional setup after loading the view.
        
        Network.GetUnits(id: idString!, completed: {
            print("Succesful")
            self.tableView.reloadData()
        })
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //metodo que define la altura de las celdas
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Network.units.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.UnitsName.text = Network.units[indexPath.row].name
        let baseURL = URL(string: "http://localhost:8888/AutoPro-Api/storage/app/public/")!
        let placeholderImage = UIImage(named: "autoescuela-logo.png")
        print(units)
        let remoteImageURL = baseURL.appendingPathComponent(Network.units[indexPath.row].unit_url ?? "")
        cell.UnitsImage?.sd_setImage(with: remoteImageURL, placeholderImage: placeholderImage)
        
        return cell
    }
    
    //metodo que al clicar en una celda hace una accion.
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("celda pulsada")
        idUnit = Network.units[indexPath.row].id
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let item = ( sender as? CustomTableViewCell) else { return }
        guard let indexPath = self.tableView.indexPath(for: item) else {return}
        
        let idUnit = Network.units[indexPath.row].id
        print(idUnit!)
        let info = segue.destination as! UnidadViewController
        info.idUnitString = "\(idUnit!)" as! String
        
    }
    
    
    //    func GetUnits (id : String, completed: @escaping () -> ()) {
    //
    //        let url = URL(string: "http://localhost:8888/Api-AutoPro/public/api/unitcontent/\(id)")
    ////        let url = URL(string: "http://localhost:8888/Api-AutoPro/public/api/unitcontent/\(idThemes!)")
    //
    //        let json = ["api_token": "24"]
    //
    //        Alamofire.request(url!, method: .get, parameters: json, headers: nil).responseJSON { (response) in
    //            print(response)
    //
    //
    //            do {
    //                self.units = try JSONDecoder().decode([Unidades].self, from: response.data!)
    //                DispatchQueue.main.async{
    //                    completed()
    //                }
    //
    //            }catch {
    //                print(error)
    //
    //            }
    //            }.resume()
    //    }
    
}
