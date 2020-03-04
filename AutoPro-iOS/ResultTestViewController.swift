//
//  ResultTestViewController.swift
//  AutoPro-iOS
//
//  Created by alumnos on 04/03/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage




class ResultsTestViewController: UIViewController{
    
    
    @IBOutlet weak var answerA: UILabel!
    @IBOutlet weak var answerB: UILabel!
    @IBOutlet weak var answerC: UILabel!
    @IBOutlet weak var buttonA: togglebutton!
    @IBOutlet weak var buttonB: togglebutton!
    @IBOutlet weak var buttonC: togglebutton!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var recargar: UIActivityIndicatorView!
    @IBOutlet var answers: [togglebutton]!
    @IBOutlet weak var tittle: UIButton!
    @IBOutlet weak var endButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    var numberPregunta:Int = 1
    var arrayAciertos:[Bool] = [true, true, true,true, true, true, true, true, true, true]
    @IBOutlet weak var numeroPregunta: UILabel!
    @IBOutlet weak var finaliza: UIButton!

    @IBAction func nextButton(_ sender: Any) {
        questionId = questionId+1
        numberPregunta = numberPregunta+1
        reloadData()
    }
    @IBAction func backQuestion(_ sender: Any) {
        questionId = questionId-1
        numberPregunta = numberPregunta-1
        reloadData()
    }
    private func reloadData(){
        tittle.isEnabled = true
        tittle.isHidden = false
        endButton.setNeedsDisplay()
        endButton.isEnabled = false
        endButton.isHidden = true
        if(questionId==questions.count-1){
            tittle.isEnabled = false
            tittle.isHidden = true
            tittle.setNeedsDisplay()
            endButton.isEnabled = true
            
            endButton.isHidden = false
            
        }
        print(arrayOption[9])
        answers.forEach { $0.activateButton(bool: false) }
        if(questions[0].correctAnswer.rawValue == "answer_a"){
            buttonA.aciertoColor(bool: true)
        }else if(questions[0].correctAnswer.rawValue == "answer_b"){
            buttonB.aciertoColor(bool: true)
        }else if(questions[0].correctAnswer.rawValue == "answer_c"){
            buttonC.aciertoColor(bool: true)
        }
        switch arrayOption[questionId] {
        case "a":
            if(buttonA.acierto){
                buttonA.aciertoColor(bool: true)
            }else{
                buttonA.falloColor(bool: true)
            }
        case "b":
            if(buttonB.acierto){
                buttonB.aciertoColor(bool: true)
            }else{
                buttonB.falloColor(bool: true)
            }
        case "c":
            if(buttonC.acierto){
                buttonC.aciertoColor(bool: true)
            }else{
                buttonC.falloColor(bool: true)
            }
        default:
            answers.forEach { $0.activateButton(bool: false) }
        }
        answerA.text = questions[questionId].answerA
        answerB.text = questions[questionId].answerB
        answerC.text = questions[questionId].answerC
        numeroPregunta.text = "\(numberPregunta)/\(questions.count)"
        backButton.isHidden = false
        if(questionId==0){
            backButton.isHidden = true
        }
        let baseURL = URL(string: "http://localhost:8888/autopro/AutoPro-API-features-migrations/storage/app/public/")!
        let placeholderImage = UIImage(named: "autoescuela-logo.png")
        let remoteImageURL = baseURL.appendingPathComponent(questions[questionId].photoURL)
        img?.sd_setImage(with: remoteImageURL, placeholderImage: placeholderImage)
        question.text = questions[questionId].question
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        backButton.isHidden = true
        questionId = 0
        reloadData()
        recargar.stopAnimating()
        numberPregunta = 1
        numeroPregunta.text = "\(numberPregunta)/\(questions.count)"
    }
}
