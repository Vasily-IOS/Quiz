//
//  SettingsViewController.swift
//  MoneyQuiz
//
//  Created by Василий on 29.12.2021.
//

import UIKit

final class SettingsViewController: UIViewController {

// MARK: - properties

    var difficulty: Difficulty?

    let selectQuestionLabel = UILabel()
    let segmentControl = UISegmentedControl(items: ["По порядку", "Перемешать"])

// MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.segmentControl.selectedSegmentIndex = Game.shared.difficulty.rawValue
        setupView()
    }

// MARK: - business logic

    @objc func segmentControlAction(_ sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            Game.shared.difficulty = .order
        case 1:
            Game.shared.difficulty = .shuffled
        default:
            break
        }
    }

// MARK: - UI

    private func setupView(){
        title = "Настройки"

        selectQuestionLabel.translatesAutoresizingMaskIntoConstraints = false
        selectQuestionLabel.text = "Поменяйте порядок вопросов"
        selectQuestionLabel.textColor = .black
        selectQuestionLabel.textAlignment = .center

        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.backgroundColor = .green
        segmentControl.tintColor = .black
        segmentControl.addTarget(self, action: #selector(segmentControlAction), for: .valueChanged)

        view.addSubview(selectQuestionLabel)
        NSLayoutConstraint.activate([
            selectQuestionLabel.widthAnchor.constraint(equalToConstant: 300),
            selectQuestionLabel.heightAnchor.constraint(equalToConstant: 50),
            selectQuestionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectQuestionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])

        view.addSubview(segmentControl)
        NSLayoutConstraint.activate([
            segmentControl.widthAnchor.constraint(equalToConstant: 300),
            segmentControl.heightAnchor.constraint(equalToConstant: 50),
            segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentControl.topAnchor.constraint(equalTo: selectQuestionLabel.bottomAnchor, constant: 30)
        ])
    }

}
