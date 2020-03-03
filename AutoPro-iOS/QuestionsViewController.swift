import UIKit
import Alamofire
import SDWebImage

var questions = [Question]()
var questionId:Int = 0
var fallos:Int = 0
var aciertos:Int = 0
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
    
    @IBOutlet weak var finaliza: UIButton!
    @IBAction func finalizar(_ sender: Any) {
        if(buttonA.isOn || buttonB.isOn || buttonC.isOn){
            
            if(buttonA.isOn){
                if(questions[questionId].correctAnswer.rawValue == "answer_a"){
                    aciertos = aciertos+1
                }else{
                    fallos = fallos+1
                }
            }else if(buttonB.isOn){
                if(questions[questionId].correctAnswer.rawValue == "answer_b"){
                    aciertos = aciertos+1
                }else{
                    fallos = fallos+1
                }
            }else{
                if(questions[questionId].correctAnswer.rawValue == "answer_c"){
                    aciertos = aciertos+1
                }else{
                    fallos = fallos+1
                }
            }
            questionId = 0
            self.performSegue(withIdentifier: "finalizar", sender: sender)
            
        }
        
    }
    @IBAction func nextQuestion(_ sender: UIButton) {
        if(buttonA.isOn || buttonB.isOn || buttonC.isOn){
            if(buttonA.isOn){
                if(questions[questionId].correctAnswer.rawValue == "answer_a"){
                    aciertos = aciertos+1
                }else{
                    fallos = fallos+1
                }
            }else if(buttonB.isOn){
                if(questions[questionId].correctAnswer.rawValue == "answer_b"){
                    aciertos = aciertos+1
                }else{
                    fallos = fallos+1
                }
            }else{
                if(questions[questionId].correctAnswer.rawValue == "answer_c"){
                    aciertos = aciertos+1
                }else{
                    fallos = fallos+1
                }
            }
            questionId = questionId+1
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
        finaliza.isEnabled = false
        reloadData()
        recargar.stopAnimating()
    }
    
    private func reloadData(){
        if(questionId==questions.count-1){
            tittle.isEnabled = false
            tittle.isHidden = true
            tittle.setNeedsDisplay()
            finaliza.isEnabled = true
            
            finaliza.isHidden = false
            
        }
        answerA.text = questions[questionId].answerA
        answerB.text = questions[questionId].answerB
        answerC.text = questions[questionId].answerC
        let baseURL = URL(string: "http://localhost:8888/autopro/AutoPro-API-features-migrations/storage/app/public/")!
        let placeholderImage = UIImage(named: "autoescuela-logo.png")
        let remoteImageURL = baseURL.appendingPathComponent(questions[questionId].photoURL)
        img?.sd_setImage(with: remoteImageURL, placeholderImage: placeholderImage)
        question.text = questions[questionId].question
        answers.forEach { $0.activateButton(bool: false) }
    }
}
