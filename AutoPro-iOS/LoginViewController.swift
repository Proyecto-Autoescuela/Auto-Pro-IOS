//
//  ViewController.swift
//  AutoPro-iOS
//
//  Created by alumnos on 08/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

//Prueba del Git 

import UIKit
import Alamofire

var errorBool:Bool = false

class LoginViewController: UIViewController {

    @IBOutlet weak var loginName: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginName.text = "raulgon@cev.com"
        loginPassword.text = "raul123"
        

        
//        Network.GetLessons{
//            //
//        }
        Network.postTest()
//        Network.getTest {
//            //
//        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickButton(_ sender: Any) {
//        UserDefaults.standard.set(loginName.text!, forKey: "email")
        self.showSpinner()
        
        Timer.scheduledTimer(withTimeInterval: 20.0, repeats: false) { (t) in
            print("done")
            
        }
        guard let email = loginName.text, loginName.text?.count != 0 else {
                createAlert(title: "Fallo", message: "Pon tu Usuario para continuar")
                return
            }
            if isValidEmail(emailID: email) == false {
                createAlert(title: "Fallo", message: "Pon un email correcto")
            }
            
        guard let password = loginPassword.text, loginPassword.text?.count != 0 else {
                createAlert(title: "Fallo", message: "Pon tu contraseña para continuar")	
                return
            }
        
        Network.getUser(email: email
            , password: password, sender: sender, completion: {result, student in
            if result == true{
                    
                if student {
                    self.performSegue(withIdentifier: "alumno", sender: sender)
                        
                }else{
                    self.performSegue(withIdentifier: "profesor", sender: sender)
                        
                }
                    
            }else{
                if(errorBool){
                        self.createAlert(title: "error", message: "email o contraseña incorrectos")
                }else{
                        self.createAlert(title: "Fallo en la conexion", message: "revisa tu conexion a internet")
                }
            }
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //metodo que verificia si el correo cumple los estandares validos ejemplo xcode@gmail.com
    
    func isValidEmail(emailID: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
    
    //metodo que crear una alertas, recibe un titulo de tipo String y un mensaje tambien de tipo
    func createAlert(title: String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (Action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

