//
//  Game.swift
//  MoneyQuiz
//
//  Created by Василий on 24.12.2021.
//

import Foundation

final class Game {

    var questions = 2
    var rightAnswers = 1
    var difficulty: Difficulty = .order

    private var session: GameSession?
    private var recordsCareTaker = RecordsCareTaker()

    static let shared = Game()

    private(set) var records: [Record] = [] {
        didSet {
            recordsCareTaker.save(records.self)
        }
    }

    private init(){
        self.records = recordsCareTaker.load()
    }

    func addRecord(_ record: Record){
        self.records.append(record)
    }

    func startGame() -> GameSession {
        let newSession = GameSession()
        self.session = newSession
        self.questions = newSession.questionCount
        self.rightAnswers = newSession.rightAnswers
        newSession.difficulty = self.difficulty
        return newSession
    }

    func gameEnded() {
        guard let sessionOfGame = session else { return }
        let record = Record(record: sessionOfGame.rightAnswers, date: Date())
        self.records.append(record)
        self.session = nil
    }

}
