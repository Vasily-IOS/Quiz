//
//  QuestionBank.swift
//  MoneyQuiz
//
//  Created by Василий on 25.12.2021.
//

import Foundation

final class QuestionBank {

    static let list = [
        Question(text: "В каком году началась Первая Мировая Война?", optionA: "1939 г.", optionB: "1914 г.",
                 optionC: "1935 г.", optionD: "1945 г.", correct: 2),
        Question(text: "Самая высокая гора на Земле?", optionA: "Эльбрус", optionB: "Эверест",
                 optionC: "К2", optionD: "Пик Ленина", correct: 2),
        Question(text: "Какой самый большой человеческий орган?", optionA: "Кожа", optionB: "Легкие",
                 optionC: "Мочевой пузырь", optionD: "Сердце", correct: 1),
        Question(text: "В каком году был первый полет человека в космос?", optionA: "1970 г.", optionB: "1980 г.",
                 optionC: "1961 г.", optionD: "1963 г.", correct: 3),
        Question(text: "Зачем людям брови?", optionA: "Просто так", optionB: "Для красоты",
                 optionC: "Чтобы выделяться", optionD: "Для защиты от пыли", correct: 4),
        Question(text: "Кто написал Идиота?", optionA: "Ф. М. Достоевский", optionB: "А. С. Пушкин",
                 optionC: "Н. В. Гоголь", optionD: "Л. Н. Толстой", correct: 1),
        Question(text: "Какая по счету от солнца планета Земля?", optionA: "1", optionB: "2",
                 optionC: "3", optionD: "4", correct: 3),
        Question(text: "Императором какой страны был Наполеон?", optionA: "Англия", optionB: "Турция",
                 optionC: "Россия", optionD: "Франция", correct: 4),
        Question(text: "Сколько золотых мячей у Лионеля Месси?", optionA: "2", optionB: "10",
                 optionC: "4", optionD: "7", correct: 4),
        Question(text: "Игра топчик или так себе?", optionA: "Топчик", optionB: "Ну такое",
                 optionC: "Говно", optionD: "Просто космос", correct: 4)
    ]
    
}
