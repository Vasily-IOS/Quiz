//
//  DifficultyProtocol.swift
//  MoneyQuiz
//
//  Created by Василий on 08.01.2022.
//

import Foundation

protocol GameStrategy: AnyObject {
    func changeGameLevel() -> [Question]
}
