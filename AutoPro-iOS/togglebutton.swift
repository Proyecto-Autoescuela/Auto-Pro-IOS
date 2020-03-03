//
//  togglebutton.swift
//  AutoPro-iOS
//
//  Created by alumnos on 26/02/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class togglebutton: UIButton {

    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = Colors.bluebutton.cgColor
        layer.cornerRadius = frame.size.height/2
        
        setTitleColor(Colors.bluebutton, for: .normal)
        addTarget(self, action: #selector(togglebutton.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        
        isOn = bool
        
        let color = bool ? Colors.bluebutton : .clear
        var opcion: String = self.titleLabel!.text!
        let title = bool ? opcion : opcion
        let titleColor = bool ? .white : Colors.bluebutton
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
    }
    
    
}

