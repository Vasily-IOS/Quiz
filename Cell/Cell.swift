//
//  Cell.swift
//  MoneyQuiz
//
//  Created by Василий on 28.12.2021.
//

import UIKit

final class Cell: UITableViewCell {

    let reuseId = "reuseId"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseId)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
