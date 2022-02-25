//
//  UIView + Extensions.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 26.02.2022.
//

import UIKit
extension UIView {
    
    func setStandartViewSettings() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
    }
    
    func addShadowOnView() {
        layer.shadowColor = UIColor.specialBlue.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 1
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
}
