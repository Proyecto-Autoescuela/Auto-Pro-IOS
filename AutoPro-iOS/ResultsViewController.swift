//
//  ResultsViewController.swift
//  AutoPro-iOS
//
//  Created by alumnos on 26/02/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController{
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if(fallos<3){
          resultLabel.text = "Has aprobado has tenido solo \(fallos) fallos"
        }else{
            resultLabel.text = "Has suspendido has tenido \(fallos) fallos"
        }
        Network.postTest()
    }
    
}
