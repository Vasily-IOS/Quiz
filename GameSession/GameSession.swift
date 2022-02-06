//
//  GameSession.swift
//  MoneyQuiz
//
//  Created by Василий on 24.12.2021.
//

import Foundation

final class GameSession {

    var questionCount = 0
    var rightAnswers = 0
    var difficulty: Difficulty = .order
    var result: Int = 0
}

// MARK: - extension

extension GameSession: GameSessionDelegate {
    func gameStarted(_ numberOfQuestions: Int) {
        self.questionCount = numberOfQuestions
    }

    func gameEnded(_ rightAnswers: Int) {
        self.rightAnswers = rightAnswers
    }
}
