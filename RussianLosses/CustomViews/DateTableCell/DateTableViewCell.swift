//
//  DateTableViewCell.swift
//  RussianLosses
//
//  Created by  Sasha Khomenko on 20.07.2022.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: DateTableViewCell.self)

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    func setup(personnel: Personnel) {
        dayLabel.text = personnel.dayToString
        dateLabel.text = personnel.date
    }
}
