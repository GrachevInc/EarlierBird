//
//  UILabel + Extension.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 26.02.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, textAlignment: NSTextAlignment, font: UIFont?, textColor: UIColor) {
        self.init()
        self.text = text
        self.textAlignment = textAlignment
        self.font = font
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
