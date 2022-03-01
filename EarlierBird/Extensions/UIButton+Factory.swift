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
    
    static func createDefaultButton(image imageName: String,
                                        setTitle title: String,
                                        target: Any?,
                                        action: Selector) -> UIButton {
        
        let button = UIButton(type: .system)
        button.tintColor = .specialGreen
        button.backgroundColor = .specialGreen
        button.setTitle(title,
                        for: .normal)
        button.setTitleColor(.specialBlue,
                             for: .normal)
        button.titleLabel?.font = .specialRobotoMedium16()
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.7
        button.setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal),
                        for: .normal)
        button.addTarget(target,
                         action: action,
                         for: .touchUpInside)
        button.layer.cornerRadius = Constants.CornerRadius.defaultCornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addShadowOnView()
        return button
    }
}

