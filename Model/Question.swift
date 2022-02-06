//
//  Question.swift
//  MoneyQuiz
//
//  Created by Василий on 24.12.2021.
//

import Foundation

struct Question: Codable {
    let text: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let correct: Int
}
