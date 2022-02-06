//
//  RecordsCareTaker.swift
//  MoneyQuiz
//
//  Created by Василий on 17.01.2022.
//

import Foundation

final class RecordsCareTaker {

    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let key = "key"

    func save(_ record: [Record]) {
        do {
            let data = try encoder.encode(record)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch let error {
            print(error)
        }
    }

    func load() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
          return try decoder.decode([Record].self, from: data)
        } catch let error {
            print(error)
            return []
        }
    }

}
