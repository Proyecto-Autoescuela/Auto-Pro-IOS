//
//  TemarioViewController.swift
//  AutoPro-iOS
//
//  Created by user161846 on 1/29/20.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

//var themes = [Temario]()
var idThemes: Int?

class TemarioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var unidadTemario: String = ""
    var idString: String?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
   //metodo que indicamos que el tabeView tenga el mismo tamaño que el array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Network.themes.count
    }
    //metodo que define la altura de las celdas
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    //metodo que al clicar en una celda hace una accion.
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("celda pulsada")
        unidadTemario = Network.themes[indexPath.row].name!.capitalized
        idThemes = Network.themes[indexPath.row].id
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let item = ( sender as? CustomTableViewCell) else { return }
        guard let indexPath = self.tableView.indexPath(for: item) else {return}
        let idThemes = Network.themes[indexPath.row].id
        let info = segue.destination as! ListarUnidadesViewController
        info.idString = "\(idThemes!)" as! String
        
//        let info  = segue.destination as! Network
//        info.Network.idString = "\(idThemes!)" as! String

        
    }
    
    //Este método: cellForRowAtIndexPath(), nos permite especificar los datos que mostraremos en cada celda y se ejecutará tantas veces como le hayamos indicado en el numberofrowsSection
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell

        cell.labelUnits.text = Network.themes[indexPath.row].name
        
        
        let baseURL = URL(string: "http://localhost:8888/Api-AutoPro/storage/app/public")!
        let placeholderImage = UIImage(named: "autoescuela-logo.png")
        print(Network.themes)
        let remoteImageURL = baseURL.appendingPathComponent(Network.themes[indexPath.row].img!)
        print(remoteImageURL)
        cell.imageUnits?.sd_setImage(with: remoteImageURL, placeholderImage: placeholderImage)
        
        
        return cell
        
    }
    
}
