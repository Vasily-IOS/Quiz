//
//  ViewController.swift
//  MoneyQuiz
//
//  Created by Василий on 24.12.2021.
//

import UIKit

final class StartViewController: UIViewController {

// MARK: - properties

    let gameButton = UIButton()
    let resultButton = UIButton()
    let addQuestionButton = UIButton()
    let settingsButton = UIButton()
    let recordLabel = UILabel()

    let questionsCareTaker = QuestionsCareTaker()

// MARK: - lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let record = Game.shared.records.last else { return }
        self.recordLabel.text = "Последний выигрыш: \(record.record) млн"
    }

// MARK: - business logic

    @objc func buttonPressed(_ sender: UIButton){
        if sender.tag == 1 {
            let session = Game.shared.startGame()
            let gameViewController = GameViewController(difficulty: session.difficulty)
            gameViewController.sessionDelegate = session
            navigationController?.pushViewController(gameViewController, animated: true)
        }
        if sender.tag == 2 {
            let vc = ResultsViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        if sender.tag == 3 {
            let vc = AddQuestionViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        if sender.tag == 4 {
            let vc = SettingsViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }

// MARK: - UI

    private func setupView(){
        title = "Меню"

        gameButton.tag = 1
        resultButton.tag = 2
        addQuestionButton.tag = 3
        settingsButton.tag = 4

        gameButton.setTitle("Играть", for: .normal)
        resultButton.setTitle("Результаты", for: .normal)
        addQuestionButton.setTitle("Добавить вопрос", for: .normal)
        settingsButton.setTitle("Настройки", for: .normal)

        recordLabel.textColor = .black
        recordLabel.translatesAutoresizingMaskIntoConstraints = false
        recordLabel.textAlignment = .center

        [gameButton, resultButton, addQuestionButton, settingsButton].forEach{
             $0.translatesAutoresizingMaskIntoConstraints = false
             $0.layer.cornerRadius = 5
             $0.backgroundColor = .yellow
             $0.setTitleColor(.black, for: .normal)
             $0.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        }

        view.addSubview(gameButton)
        NSLayoutConstraint.activate([
            gameButton.heightAnchor.constraint(equalToConstant: 50),
            gameButton.widthAnchor.constraint(equalToConstant: 200),
            gameButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            gameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(resultButton)
        NSLayoutConstraint.activate([
            resultButton.heightAnchor.constraint(equalToConstant: 50),
            resultButton.widthAnchor.constraint(equalToConstant: 200),
            resultButton.topAnchor.constraint(equalTo: gameButton.bottomAnchor, constant: 40),
            resultButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(addQuestionButton)
        NSLayoutConstraint.activate([
            addQuestionButton.heightAnchor.constraint(equalToConstant: 50),
            addQuestionButton.widthAnchor.constraint(equalToConstant: 200),
            addQuestionButton.topAnchor.constraint(equalTo: resultButton.bottomAnchor, constant: 40),
            addQuestionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(settingsButton)
        NSLayoutConstraint.activate([
            settingsButton.heightAnchor.constraint(equalToConstant: 50),
            settingsButton.widthAnchor.constraint(equalToConstant: 200),
            settingsButton.topAnchor.constraint(equalTo: addQuestionButton.bottomAnchor, constant: 40),
            settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(recordLabel)
        NSLayoutConstraint.activate([
            recordLabel.heightAnchor.constraint(equalToConstant: 30),
            recordLabel.widthAnchor.constraint(equalToConstant: 230 ),
            recordLabel.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 40),
            recordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
