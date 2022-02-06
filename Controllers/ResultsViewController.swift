//
//  ResultsViewController.swift
//  MoneyQuiz
//
//  Created by Василий on 24.12.2021.
//

import UIKit

final class ResultsViewController: UIViewController {

// MARK: - properties

    let tableView = UITableView()
    let reuseId = "reuseId"

// MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }

// MARK: - UI

    private func setupView(){
        title = "Результаты"

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseId)
        tableView.register(Cell.self, forCellReuseIdentifier: reuseId)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
    }

}

// MARK: - tableViewDataSource & tableViewDelegate extensions

extension ResultsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? Cell
        else { return UITableViewCell() }
        let records = Game.shared.records[indexPath.row]
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = .full
        let time = dataFormatter.string(from: records.date)
        cell.textLabel?.text = "Выигрыш: \(records.record) млн"
        cell.detailTextLabel?.text = "\(time)"
        return cell
    }

}

extension ResultsViewController: UITableViewDelegate {}
