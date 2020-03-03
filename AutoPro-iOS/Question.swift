// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let test = try? newJSONDecoder().decode(Test.self, from: jsonData)

import Foundation

// MARK: - TestElement
class Question: Codable {
    let photoURL, question, answerA, answerB: String
    let answerC: String
    let correctAnswer: CorrectAnswer
    
    enum CodingKeys: String, CodingKey {
        case photoURL = "photo_url"
        case question
        case answerA = "answer_a"
        case answerB = "answer_b"
        case answerC = "answer_c"
        case correctAnswer = "correct_answer"
    }
    
    init(photoURL: String, question: String, answerA: String, answerB: String, answerC: String, correctAnswer: CorrectAnswer) {
        self.photoURL = photoURL
        self.question = question
        self.answerA = answerA
        self.answerB = answerB
        self.answerC = answerC
        self.correctAnswer = correctAnswer
    }
}

enum CorrectAnswer: String, Codable {
    case answerA = "answer_a"
    case answerB = "answer_b"
    case answerC = "answer_c"
}

typealias Test = [Question]
