//
//  UIImageView + Ext.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 26.02.2022.
//

import Foundation
import UIKit

extension UIImageView {
    static func createDefault(named name: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: name)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    convenience init(defaultNamed name: String) {
        self.init()
        self.image = UIImage(named: name)
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
