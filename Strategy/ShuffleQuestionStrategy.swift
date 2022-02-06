//
//  ShuffleQuestionStrategy.swift
//  MoneyQuiz
//
//  Created by Василий on 08.01.2022.
//

import Foundation

final class ShuffleQuestionStrategy: GameStrategy {

    private let questionsCareTaker = QuestionsCareTaker()

    func changeGameLevel() -> [Question] {
        return self.questionsCareTaker.load().shuffled()
    }
    
}
