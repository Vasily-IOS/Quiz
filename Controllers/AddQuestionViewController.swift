//
//  AddQuestionViewController.swift
//  MoneyQuiz
//
//  Created by Василий on 29.12.2021.
//

import UIKit

final class AddQuestionViewController: UIViewController {

// MARK: - properties

    let questionTextField = UITextField()
    let firstAnswerTextField = UITextField()
    let secondAnswerTextField = UITextField()
    let thirdAnswerTextField = UITextField()
    let fouthAnswerTextField = UITextField()
    let isCorrectTextField = UITextField()
    let addButton = UIButton()
    let testDeleteButton = UIButton()

    let careTaker = QuestionsCareTaker()

// MARK: - lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

// MARK: - business logic

    @objc func addQuestionButton(){
        let newValue = Question(text: questionTextField.text ?? "", optionA: firstAnswerTextField.text ?? "", optionB: secondAnswerTextField.text ?? "", optionC: thirdAnswerTextField.text ?? "", optionD: fouthAnswerTextField.text ?? "", correct: Int(isCorrectTextField.text ?? "") ?? 0)

        careTaker.append(question: newValue)

        [questionTextField, firstAnswerTextField, secondAnswerTextField, thirdAnswerTextField,
         fouthAnswerTextField, isCorrectTextField].forEach{
            $0.text = nil
         }
        
    }
    
// MARK: - UI

    func setupView(){

        title = "Добавить вопрос"
        view.backgroundColor = .white

        [questionTextField, firstAnswerTextField, secondAnswerTextField, thirdAnswerTextField,
         fouthAnswerTextField, isCorrectTextField].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .white
            $0.textColor = .black
            $0.borderStyle = .line
            $0.layer.cornerRadius = 5
         }

        questionTextField.placeholder = "Введите вопрос.."
        firstAnswerTextField.placeholder = "Первый ответ.."
        secondAnswerTextField.placeholder = "Второй ответ.."
        thirdAnswerTextField.placeholder = "Третий ответ.."
        fouthAnswerTextField.placeholder = "Четвертый ответ.."
        isCorrectTextField.placeholder = "Номер верного ответа.."

        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("Добавить вопрос", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.backgroundColor = .yellow
        addButton.layer.cornerRadius = 5
        addButton.layer.borderWidth = 0.1
        addButton.addTarget(self, action: #selector(addQuestionButton), for: .touchUpInside)

        view.addSubview(questionTextField)
        NSLayoutConstraint.activate([
            questionTextField.heightAnchor.constraint(equalToConstant: 50),
            questionTextField.widthAnchor.constraint(equalToConstant: 300),
            questionTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            questionTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(firstAnswerTextField)
        NSLayoutConstraint.activate([
            firstAnswerTextField.heightAnchor.constraint(equalToConstant: 50),
            firstAnswerTextField.widthAnchor.constraint(equalToConstant: 300),
            firstAnswerTextField.topAnchor.constraint(equalTo: questionTextField.bottomAnchor, constant: 30),
            firstAnswerTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(secondAnswerTextField)
        NSLayoutConstraint.activate([
            secondAnswerTextField.heightAnchor.constraint(equalToConstant: 50),
            secondAnswerTextField.widthAnchor.constraint(equalToConstant: 300),
            secondAnswerTextField.topAnchor.constraint(equalTo: firstAnswerTextField.bottomAnchor, constant: 30),
            secondAnswerTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(thirdAnswerTextField)
        NSLayoutConstraint.activate([
            thirdAnswerTextField.heightAnchor.constraint(equalToConstant: 50),
            thirdAnswerTextField.widthAnchor.constraint(equalToConstant: 300),
            thirdAnswerTextField.topAnchor.constraint(equalTo: secondAnswerTextField.bottomAnchor, constant: 30),
            thirdAnswerTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(fouthAnswerTextField)
        NSLayoutConstraint.activate([
            fouthAnswerTextField.heightAnchor.constraint(equalToConstant: 50),
            fouthAnswerTextField.widthAnchor.constraint(equalToConstant: 300),
            fouthAnswerTextField.topAnchor.constraint(equalTo: thirdAnswerTextField.bottomAnchor, constant: 30),
            fouthAnswerTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(isCorrectTextField)
        NSLayoutConstraint.activate([
            isCorrectTextField.heightAnchor.constraint(equalToConstant: 50),
            isCorrectTextField.widthAnchor.constraint(equalToConstant: 300),
            isCorrectTextField.topAnchor.constraint(equalTo: fouthAnswerTextField.bottomAnchor, constant: 30),
            isCorrectTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.widthAnchor.constraint(equalToConstant: 200),
            addButton.topAnchor.constraint(equalTo: isCorrectTextField.bottomAnchor, constant: 80),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
