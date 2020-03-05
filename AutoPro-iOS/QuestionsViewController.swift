import UIKit
import Alamofire
import SDWebImage

var questions = [Question]()
var questionId:Int = 0
var fallos:Int = 0
var fallo:Int = 0
var acierto:Int = 0
var aciertos:Int = 0
var numberPregunta:Int = 1
var arrayOption:[String] = ["", "", "", "", "", "", "", "", "", ""]
var arrayAciertos:[Bool] = [true, true, true,true, true, true, true, true, true, true]
class QuestionsViewController: UIViewController {
    
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
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBOutlet weak var numeroPregunta: UILabel!
    @IBOutlet weak var finaliza: UIButton!
    
    
    @IBAction func volver(_ sender: Any) {
        if(buttonA.isOn || buttonB.isOn || buttonC.isOn){
            if(buttonA.isOn){
                arrayOption[questionId] = "a"
                if(questions[questionId].correctAnswer.rawValue == "answer_a"){
                    aciertos = aciertos+1
                    arrayAciertos[questionId] = true
                }else{
                    fallos = fallos+1
                    arrayAciertos[questionId] = false
                }
            }else if(buttonB.isOn){
                arrayOption[questionId] = "b"
                if(questions[questionId].correctAnswer.rawValue == "answer_b"){
                    aciertos = aciertos+1
                    arrayAciertos[questionId] = true
                }else{
                    fallos = fallos+1
                    arrayAciertos[questionId] = false
                }
            }else{
                arrayOption[questionId] = "c"
                if(questions[questionId].correctAnswer.rawValue == "answer_c"){
                    arrayAciertos[questionId] = true
                    aciertos = aciertos+1
                }else{
                    fallos = fallos+1
                    arrayAciertos[questionId] = false
                }
            }
            
            
            reloadData()
        }
        questionId = questionId - 1
        numberPregunta = numberPregunta-1
        
        if(!arrayAciertos[questionId]){
            fallos = fallos-1
        }else{
            aciertos = aciertos-1
        }
        reloadData()
    }
    @IBAction func finalizar(_ sender: Any) {
        if(buttonA.isOn || buttonB.isOn || buttonC.isOn){
            for inde in arrayAciertos {
                print(inde)
                if(inde){
                    acierto = acierto+1
                }else{
                    fallo = fallo+1
                }
            }
            
            if(buttonA.isOn){
                arrayOption[questionId] = "a"
                if(questions[questionId].correctAnswer.rawValue == "answer_a"){
                    
                    questionId = 0
                    self.performSegue(withIdentifier: "finalizar", sender: sender)
                }else{
                    fallo = fallo+1
                    acierto = acierto-1
                    questionId = 0
                    self.performSegue(withIdentifier: "finalizar", sender: sender)
                }
            }else if(buttonB.isOn){
                arrayOption[questionId] = "b"
                if(questions[questionId].correctAnswer.rawValue == "answer_b"){
                    
                    questionId = 0
                    self.performSegue(withIdentifier: "finalizar", sender: sender)
                }else{
                    fallo = fallo+1
                    acierto = acierto-1
                    questionId = 0
                    self.performSegue(withIdentifier: "finalizar", sender: sender)
                }
            }else{
                arrayOption[questionId] = "c"
                if(questions[questionId].correctAnswer.rawValue == "answer_c"){
                    
                    questionId = 0
                    self.performSegue(withIdentifier: "finalizar", sender: sender)
                }else{
                    fallo = fallo+1
                    acierto = acierto-1
                    questionId = 0
                    self.performSegue(withIdentifier: "finalizar", sender: sender)
                    
                }
            }
            
            
        }
        
    }
    @IBAction func nextQuestion(_ sender: UIButton) {
        if(buttonA.isOn || buttonB.isOn || buttonC.isOn){
            if(buttonA.isOn){
                arrayOption[questionId] = "a"
                if(questions[questionId].correctAnswer.rawValue == "answer_a"){
                    aciertos = aciertos+1
                    arrayAciertos[questionId] = true
                }else{
                    fallos = fallos+1
                    arrayAciertos[questionId] = false
                }
            }else if(buttonB.isOn){
                arrayOption[questionId] = "b"
                if(questions[questionId].correctAnswer.rawValue == "answer_b"){
                    aciertos = aciertos+1
                    arrayAciertos[questionId] = true
                }else{
                    fallos = fallos+1
                    arrayAciertos[questionId] = false
                }
            }else{
                arrayOption[questionId] = "c"
                if(questions[questionId].correctAnswer.rawValue == "answer_c"){
                    arrayAciertos[questionId] = true
                    aciertos = aciertos+1
                }else{
                    fallos = fallos+1
                    arrayAciertos[questionId] = false
                }
            }
            questionId = questionId+1
            numberPregunta = numberPregunta+1
            
            reloadData()
        }
        print(aciertos, fallos)
        
    }
    @IBAction func buttonClick(_ sender: togglebutton) {
        answers.forEach { $0.activateButton(bool: false) }
        sender.activateButton(bool: true) // check the button that is clicked on
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        finaliza.isHidden = true
        backButton.isHidden = true
        finaliza.isEnabled = false
        questionId = 0
        fallos = 0
        aciertos = 0
        reloadData()
        recargar.stopAnimating()
        numberPregunta = 1
        numeroPregunta.text = "\(numberPregunta)/\(questions.count)"
    }
    
    private func reloadData(){
        tittle.isEnabled = true
        tittle.isHidden = false
        finaliza.setNeedsDisplay()
        finaliza.isEnabled = false
        finaliza.isHidden = true
        if(questionId==questions.count-1){
            tittle.isEnabled = false
            tittle.isHidden = true
            tittle.setNeedsDisplay()
            finaliza.isEnabled = true
            
            finaliza.isHidden = false
            
        }
        answers.forEach { $0.activateButton(bool: false) }
        switch arrayOption[questionId] {
        case "a":
            buttonA.activateButton(bool: true)
        case "b":
            buttonB.activateButton(bool: true)
        case "c":
            buttonC.activateButton(bool: true)
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
}
