//
//  MainTabViewController.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 26.02.2022.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupItems()
        
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .specialGreen
        tabBar.tintColor = .specialBlue
        tabBar.unselectedItemTintColor = .specialBackground
        tabBar.layer.borderColor = UIColor.specialBlue.cgColor
        tabBar.layer.borderWidth = 1
        
    }

    private func setupItems() {
        let mainVC = MainViewController()
        let settingsVC = SettingsViewController()
        
        setViewControllers([mainVC, settingsVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Main"
        items[1].title = "Settings"
        items[0].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 7)
        items[1].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 7)

        
        items[0].image = UIImage(systemName: "clock.arrow.2.circlepath")
        items[1].image = UIImage(systemName: "gearshape")
        
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.specialRobotoMedium14() as Any], for: .normal)
    }
}
