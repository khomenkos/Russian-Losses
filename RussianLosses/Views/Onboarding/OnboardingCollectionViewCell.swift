//
//  OnboardingCollectionViewCell.swift
//  RussianLosses
//
//  Created by  Sasha Khomenko on 11.07.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitle: UILabel!
    @IBOutlet weak var slideDescription: UILabel!
    

    
    func setup (_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitle.text = slide.title
        slideDescription.text = slide.description
    }
}
