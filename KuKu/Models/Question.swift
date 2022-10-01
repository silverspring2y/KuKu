//
//  Question.swift
//  KuKu
//
//  Created by Shinichiro Tanaka on 2022/08/21.
//

import Foundation

struct Question: Codable, Hashable {
    let question: String
    let correctAnswer: String
    
    init(q: String, correctAnswer: String){
        question = q
        self.correctAnswer = correctAnswer
    }
    
}
