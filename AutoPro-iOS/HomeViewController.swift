//
//  HomeViewController.swift
//  AutoPro-iOS
//
//  Created by alumnos on 13/01/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBAction func imagenTest(_ sender: UIButton) {
        
        
    }
    
    @IBAction func imagenTemas(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func imagenReservas(_ sender: UIButton) {
        
    }
    
    @IBAction func imagenPerfil(_ sender: UIButton) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(), style: .plain, target: self, action: nil)
    }
    
    @IBAction func onClickLogout(_ sender: Any) {
        /*UserDefaults.standard.removeObject(forKey: "email")
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController")
        let navVC = UINavigationController(rootViewController: vc!)
        let share = UIApplication.shared.delegate as? AppDelegate
        share?.window?.rootViewController = navVC
        share?.window?.makeKeyAndVisible()*/
    }
}
