//
//  UIView.swift
//  RussianLosses
//
//  Created by  Sasha Khomenko on 11.07.2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius}
        set { self.layer.cornerRadius = newValue }
    }
}

