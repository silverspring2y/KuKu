//
//  QuizBrain.swift
//  KuKu
//
//  Created by Shinichiro Tanaka on 2022/08/21.
//

import Foundation
import UIKit

struct QuizBrain {
    
    var leftNumString: String = "1"
    var quiz: [Question] = []
    var questionNumber = 0
    var score = 0
    
    var recordsDict: [Question: Records] = [:]
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(K.recordsFile)
    
    mutating func createQuestions(times: String){
        if times == "review" {
            loadRecords()
            for _ in 1...9 {
                if let q = recordsDict.keys.randomElement() {
                    quiz.append(q)
                } else {
                    print("Review questions list is empty.")
                }
            }
        } else if times == "らんだむ" {
            for _ in 1...9 {
                let leftNum = Int.random(in: 1...9)
                let rightNum = Int.random(in: 1...9)
                quiz.append(Question(q: String(leftNum)+" x "+String(rightNum),
                                     correctAnswer: String(leftNum*rightNum)))
            }
        } else {
            leftNumString = String(times.prefix(1))
            if let leftNum = Int(leftNumString) {
                for rightNum in 1...9 {
                    quiz.append(Question(q: String(leftNum)+" x "+String(rightNum),
                                         correctAnswer: String(leftNum*rightNum)))
                }
            }
            
        }
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }

    func getQuestion() -> Question {
        return quiz[questionNumber]
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].question
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuesition() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    
    // MARK: - Model Manipulation Methods
    
    mutating func loadRecords(){
        if let data = try? Data(contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
            do {
                recordsDict = try decoder.decode([Question: Records].self, from: data)
                print(recordsDict)
            } catch {
                print("Error decoding records array, \(error)")
            }
            
        }
    }
    
}



