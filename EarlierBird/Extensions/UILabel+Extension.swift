//
//  UILabel + Extension.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 26.02.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String,
                     textAlignment: NSTextAlignment,
                     font: UIFont?,
                     textColor: UIColor) {
        self.init()
        self.text = text
        self.textAlignment = textAlignment
        self.font = font
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    static func createDefaultSettingsLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.font = .specialRobotoBold18()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    convenience init(text: String) {
        self .init()
        self.text = text
        self.textAlignment = .center
        self.font = .specialRobotoBold18()
        self.textColor = .white
    }
    
    convenience init(text: String,
                     font: UIFont?) {
        self .init()
        self.text = text
        self.textAlignment = .center
        self.font = font
        self.textColor = .white
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
