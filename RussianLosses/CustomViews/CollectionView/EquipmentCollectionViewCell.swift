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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(equipment: ModelCell) {
        titleLbl.text = equipment.title
        imageView.image = equipment.image
        countLbl.text = equipment.count
    }

}
