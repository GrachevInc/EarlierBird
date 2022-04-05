//
//  MainTabViewController.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 26.02.2022.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    enum Constants {
        enum Colors {
            static let backgroundColor = UIColor.specialGreen
            static let tintColor = UIColor.specialBlue
            static let unselectedItemTintColor = UIColor.specialBackground
            static let borderColor = UIColor.specialBlue.cgColor
        }
        
        enum Intervals {
            static let borderWidth: CGFloat = 1
        }
        
        enum Fonts {
            static let titleFont = UIFont.specialRobotoMedium14()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = Constants.Colors.backgroundColor
        tabBar.tintColor = Constants.Colors.tintColor
        tabBar.unselectedItemTintColor = Constants.Colors.unselectedItemTintColor
        tabBar.layer.borderColor = Constants.Colors.borderColor
        tabBar.layer.borderWidth = Constants.Intervals.borderWidth
    }
    
    private func setupItems() {
        let mainVC = MainViewController()
        let settingsVC = SettingsViewController()
        
        setViewControllers([mainVC, settingsVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Главная"
        items[1].title = "Настройки"
        
        items[0].image = UIImage(systemName: "clock.arrow.2.circlepath")
        items[1].image = UIImage(systemName: "gearshape")
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: Constants.Fonts.titleFont as Any], for: .normal)
    }
}
