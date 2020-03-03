//
//  PerfilProfesorViewController.swift
//  AutoPro-iOS
//
//  Created by alumnos on 20/02/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class PerfilProfesorViewController: UIViewController {
    
    @IBOutlet weak var nameTeacher: UILabel!
    @IBOutlet weak var emailTeacher: UILabel!
    @IBOutlet weak var numbersOfStudent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Recupero en un array la informacion persistente guardada del profesor en el login
        let teacherInfo = UserDefaults.standard.stringArray(forKey: "Teacherinfo") ?? [String]()
        
        //Asigno a una variable el primer elemento del array recuperado (En este caso es el nombre del profesor)
        let teacherName = teacherInfo[1]
        nameTeacher.text = teacherName
        let teacherEmail = teacherInfo[2]
        emailTeacher.text = teacherEmail
        let numberStudents = teacherInfo[3]
        numbersOfStudent.text = numberStudents
    }
    
}
