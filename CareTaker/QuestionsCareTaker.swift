//
//  QuestionsCareTaker.swift
//  MoneyQuiz
//
//  Created by Василий on 17.01.2022.
//

import Foundation

final class QuestionsCareTaker {

    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let key = "key"

    private var questionsArray = QuestionBank.list

    func append(question: Question) {
        do {
            self.questionsArray.append(question)
            let data = try encoder.encode(self.questionsArray)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch let error {
            print(error)
        }
    }

    func load() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return self.questionsArray }
        do {
            let questions = try decoder.decode([Question].self, from: data)
            return questions
        } catch let error {
            print(error)
            return self.questionsArray
        }
    }

}
