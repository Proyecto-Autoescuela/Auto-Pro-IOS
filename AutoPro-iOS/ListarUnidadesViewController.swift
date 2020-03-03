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

class ListarUnidadesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableView: UITableView!
    
    var units = [Unidades]()
    
    var idString: String?
    
    override func viewWillAppear(_ animated: Bool) {
        
    
        super.viewWillAppear(true)
        // Do any additional setup after loading the view.
        print(idString)
        GetUnits {
            print("Succesful")
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //metodo que define la altura de las celdas
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return units.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
            cell.UnitsName.text = units[indexPath.row].name
            let baseURL = URL(string: "http://localhost:8888/AutoPro-API-features-migrations/storage/app/public/")!
            let placeholderImage = UIImage(named: "autoescuela-logo.png")
            print(units)
        let remoteImageURL = baseURL.appendingPathComponent(units[indexPath.row].unit_url ?? "autoescuela-logo.png")
        
          cell.UnitsImage?.sd_setImage(with: remoteImageURL, placeholderImage: placeholderImage)
        
        return cell
    }
    
    //metodo que al clicar en una celda hace una accion.
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("celda pulsada")
        idUnit = units[indexPath.row].id
        self.performSegue(withIdentifier: "content", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let item = ( sender as? CustomTableViewCell) else { return }
        guard let indexPath = self.tableView.indexPath(for: item) else {return}
        
        let idUnit = units[indexPath.row].id
        let info = segue.destination as! UnidadViewController
        info.idUnitString = "\(idUnit!)" as! String
        
    }

 
    
    func GetUnits (completed: @escaping () -> ()) {
        let url = URL(string: "http://localhost:8888/autopro/AutoPro-API-features-migrations/public/api/unitcontent/\(idThemes)")

        let json = ["api_token": "24"]
//
        Alamofire.request(url!, method: .get, parameters: json, headers: nil).responseJSON { (response) in
            print(response)

            do {
                self.units = try JSONDecoder().decode([Unidades].self, from: response.data!)
                DispatchQueue.main.async{
                    completed()
                }

            }catch {
                print(error)

            }
            }.resume()
    }
    
}

