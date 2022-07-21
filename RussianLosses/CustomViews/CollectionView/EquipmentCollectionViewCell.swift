//
//  EquipmentCollectionViewCell.swift
//  RussianLosses
//
//  Created by  Sasha Khomenko on 12.07.2022.
//

import UIKit

class EquipmentCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: EquipmentCollectionViewCell.self)
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var countLbl: UILabel!

    func setup(equipment: ModelCellEquipment) {
        titleLbl.text = equipment.title
        imageView.image = UIImage(named: equipment.image)
        countLbl.text = String(equipment.amount ?? 0)
    }
}
