//
//  CustomTableViewCell.swift
//  AutoPro-iOS
//
//  Created by user161846 on 1/29/20.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    //Elementos de la pantalla Tema
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var imageUnits: UIImageView!
    @IBOutlet weak var labelUnits: UITextView!
    
    //Elmenetos de la pantalla Listar Unidades
    
    @IBOutlet weak var cellUnitsView: UIView!
    @IBOutlet weak var UnitsImage: UIImageView!
    @IBOutlet weak var UnitsName: UITextView!
    
    
    //Elemntos de la pantallas Listar Alumnos por profesor
    @IBOutlet weak var nombreAlumno: UILabel!
    @IBOutlet weak var resultadoAlumno: UILabel!
    
    //Elementos de la pantalla Horarios de reserva de Alumnos
    @IBOutlet weak var alumnoReserva: UILabel!
    @IBOutlet weak var imagenReserva: UIImageView!
    @IBOutlet weak var fechaReserva: UILabel!
    @IBOutlet weak var labelTests: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
