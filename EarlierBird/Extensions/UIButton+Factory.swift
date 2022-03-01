//
//  UIButton+Factory.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 27.02.2022.
//

import UIKit

extension UIButton {
    static func createDefaultTimeButton(image imageName: String,
                                        setTitle title: String,
                                        font: UIFont?,
                                        target: Any?,
                                        action: Selector) -> UIButton {
        
        let button = UIButton(type: .system)
        button.tintColor = .specialBlue
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = font
        button.setBackgroundImage(UIImage(named: imageName), for: .normal)
        button.contentMode = .scaleToFill
        button.addTarget(target, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
