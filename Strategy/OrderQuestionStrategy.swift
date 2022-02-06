//
//  OrderQuestions.swift
//  MoneyQuiz
//
//  Created by Василий on 08.01.2022.
//

import Foundation

final class OrderQuestionStrategy: GameStrategy {

    private let questionsCareTaker = QuestionsCareTaker()
    
    func changeGameLevel() -> [Question] {
        return self.questionsCareTaker.load()
    }

}
