//
//  TestViewController.swift
//  AutoPro-iOS
//
//  Created by alumnos on 20/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

var unitIdTest = 1

class TestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        return themes.count
    }
    //metodo que define la altura de las celdas
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    
    //Este método: cellForRowAtIndexPath(), nos permite especificar los datos que mostraremos en cada celda y se ejecutará tantas veces como le hayamos indicado en el numberofrowsSection
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        cell.labelTests.text = themes[indexPath.row].name
        
        return cell
        
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("celda pulsada")
//        unitIdTest = indexPath.row+1
//        
//        Network.getTest {
//            self.performSegue(withIdentifier: "tests", sender: nil)
//        }
//        
//    }
    
}
