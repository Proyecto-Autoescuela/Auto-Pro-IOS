//
//  AlumnosViewController.swift
//  AutoPro-iOS
//
//  Created by alumnos on 20/02/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire



class AlumnosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tabelView: UITableView!
    
    var studens = [Alumnos]()
    
    let nombreAlumno = [("Bosco Francisco")]
    let resultadoAlumno = [("80%")]
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        GetStudens {
            print("Succesful")
            self.tabelView.reloadData()
        }
        
        tabelView.delegate = self
        tabelView.dataSource = self
   
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelView.dequeueReusableCell(withIdentifier: "resultadoCell", for: indexPath as IndexPath) as! CustomTableViewCell
   
        cell.nombreAlumno.text = studens[indexPath.row].name
        cell.resultadoAlumno.text = studens[indexPath.row].license
        
        return cell
    }
    //Peticion de Alumnos por Id del profesor
    func GetStudens(completed: @escaping () -> ()) {
        
        //Recupero en un array la informacion persistente guardada del profesor en el login
        let teacherInfo = UserDefaults.standard.stringArray(forKey: "Teacherinfo") ?? [String]()
        
        //Asigno a una variable el primer elemento del array recuperado (En este caso es el Id del profesor)
        let id_user_string = teacherInfo[0]
        

        

        let url = URL(string: "http://localhost:8888/AutoPro-Api/public/api/students/teacher/\(id_user_string)")

        let json = ["api_token": "24"]

        Alamofire.request(url!, method: .get, parameters: json, headers: nil).responseJSON { (response) in
            print(response)

            do {
                self.studens = try JSONDecoder().decode([Alumnos].self, from: response.data!)
                DispatchQueue.main.async{
                    completed()
                }

            }catch {
                print(error)

            }
            }.resume()
    }
    

}
