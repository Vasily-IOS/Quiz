//
//  GameViewController.swift
//  MoneyQuiz
//
//  Created by Василий on 24.12.2021.
//

import UIKit

// MARK: - gameViewControllerDelegate

protocol GameRecordDelegate: class {
    func addRecordOfGame(_ record: Int, _ date: Date)
}

protocol GameSessionDelegate: class {
    func gameStarted(_ numberOfQuestions: Int)
    func gameEnded(_ rightAnswers: Int)
}

// MARK: - GameViewController

final class GameViewController: UIViewController {

// MARK: - properties

    private let difficulty: Difficulty

    private var questionsLoader: GameStrategy {
        switch self.difficulty {
        case .order:
            return OrderQuestionStrategy()
        case .shuffled:
            return ShuffleQuestionStrategy()
        }
    }
    
    var allQuestions: [Question] = []
    var questionNumber = 0
    var selectedAnswer = 0
    var score = 0
    var result: Double {
        return (1 / Double(allQuestions.count) * Double(score) * 100)
    }

    weak var delegate: GameRecordDelegate?
    weak var sessionDelegate: GameSessionDelegate?

    let progressView = UIProgressView()
    let questionLabel = UILabel()
    let firstAnswer = UIButton()
    let secondAnswer = UIButton()
    let thirdAnswer = UIButton()
    let fouthAnswer = UIButton()
    let currentQuestionLabel = UILabel()

// MARK: - lifecycle

    init(difficulty: Difficulty) {
        self.difficulty = difficulty
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.allQuestions = self.questionsLoader.changeGameLevel()
        setupView()
        updateQuestion()
        self.sessionDelegate?.gameStarted(allQuestions.count)
    }

// MARK: - business logic

    @objc func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            score += 1
            print(score)
            let progress: Float = 1 / Float(allQuestions.count)
            progressView.progress += progress
            questionNumber += 1
            self.currentQuestionLabel.text = "Завершено:" + " " + String(Int(self.result)) + "%"
            updateQuestion()
        } else {
            self.sessionDelegate?.gameEnded(Int(progressView.progress * 10))
            restartGame()
        }
    }

    private func updateQuestion(){
        if questionNumber < allQuestions.count {
            questionLabel.text = allQuestions[questionNumber].text
            firstAnswer.setTitle(allQuestions[questionNumber].optionA, for: .normal)
            secondAnswer.setTitle(allQuestions[questionNumber].optionB, for: .normal)
            thirdAnswer.setTitle(allQuestions[questionNumber].optionC, for: .normal)
            fouthAnswer.setTitle(allQuestions[questionNumber].optionD, for: .normal)
            selectedAnswer = allQuestions[questionNumber].correct
        } else {
            self.sessionDelegate?.gameEnded(self.allQuestions.count)
            let alertController = UIAlertController(title: "ПОЗДРАВЛЯЕМ! Вы выиграли!", message: "", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "На главную", style: .default, handler: { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
                Game.shared.gameEnded()
            })
            alertController.addAction(alertAction)
            present(alertController, animated: true)
        }
    }

    private func restartGame(){
        let alertController = UIAlertController(title: "Вы проиграли", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "На главную", style: .default) { [weak self] _ in
            self?.delegate?.addRecordOfGame(self?.score ?? 0, Date()) /// Метод вывода рекорда на главный экран!
            self?.navigationController?.popViewController(animated: true)
            Game.shared.gameEnded()
            
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }


// MARK: - UI

    private func setupView(){
        title = "Вы в игре"

        progressView.progressViewStyle = .bar
        progressView.trackTintColor = .systemGray
        progressView.progressTintColor = .green
        progressView.setProgress(Float(1 / allQuestions.count), animated: true)

        questionLabel.font = questionLabel.font.withSize(23)
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 2

        firstAnswer.tag = 1
        secondAnswer.tag = 2
        thirdAnswer.tag = 3
        fouthAnswer.tag = 4

        currentQuestionLabel.text = "Зевершено: 0%"
        currentQuestionLabel.textAlignment = .center

        [progressView, questionLabel, currentQuestionLabel].forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }

        [firstAnswer, secondAnswer, thirdAnswer, fouthAnswer].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.layer.cornerRadius = 5
            $0.backgroundColor = .yellow
            $0.setTitleColor(.black, for: .normal)
            $0.layer.borderWidth = 0.1
            $0.addTarget(self, action: #selector(answerPressed(_:)), for: .touchUpInside)
        }

        view.addSubview(progressView)
        NSLayoutConstraint.activate([
            progressView.heightAnchor.constraint(equalToConstant: 6),
            progressView.widthAnchor.constraint(equalToConstant: view.frame.width),
            progressView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -50) ,
            progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(questionLabel)
        NSLayoutConstraint.activate([
            questionLabel.heightAnchor.constraint(equalToConstant: 150),
            questionLabel.widthAnchor.constraint(equalToConstant: 400),
            questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(firstAnswer)
        NSLayoutConstraint.activate([
            firstAnswer.heightAnchor.constraint(equalToConstant: 50),
            firstAnswer.widthAnchor.constraint(equalToConstant: 200),
            firstAnswer.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10),
            firstAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(secondAnswer)
        NSLayoutConstraint.activate([
            secondAnswer.heightAnchor.constraint(equalToConstant: 50),
            secondAnswer.widthAnchor.constraint(equalToConstant: 200),
            secondAnswer.topAnchor.constraint(equalTo: firstAnswer.bottomAnchor, constant: 20),
            secondAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(thirdAnswer)
        NSLayoutConstraint.activate([
            thirdAnswer.heightAnchor.constraint(equalToConstant: 50),
            thirdAnswer.widthAnchor.constraint(equalToConstant: 200),
            thirdAnswer.topAnchor.constraint(equalTo: secondAnswer.bottomAnchor, constant: 20),
            thirdAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(fouthAnswer)
        NSLayoutConstraint.activate([
            fouthAnswer.heightAnchor.constraint(equalToConstant: 50),
            fouthAnswer.widthAnchor.constraint(equalToConstant: 200),
            fouthAnswer.topAnchor.constraint(equalTo: thirdAnswer.bottomAnchor, constant: 20),
            fouthAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(currentQuestionLabel)
        NSLayoutConstraint.activate([
            currentQuestionLabel.heightAnchor.constraint(equalToConstant: 50),
            currentQuestionLabel.widthAnchor.constraint(equalToConstant: 200),
            currentQuestionLabel.topAnchor.constraint(equalTo: fouthAnswer.bottomAnchor, constant: 50),
            currentQuestionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
