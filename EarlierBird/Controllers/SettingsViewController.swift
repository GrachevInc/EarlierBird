//
//  SettingsViewController.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 26.02.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let screenSettingsNameLabel = UILabel(text: "НАСТРОЙКИ",
                                                  textAlignment: .center,
                                                  font: .specialRobotoBold24(),
                                                  textColor: .white)
    
    private let todayDigitalDialFaceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "goal")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "05:38"
        label.textAlignment = .center
        label.font = .specialTimeFont46()
        label.textColor = .specialBlue
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let setTodayWakeUpView = SetTodayWakeUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    
    
    // MARK: - setupViews

    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(screenSettingsNameLabel)
        view.addSubview(setTodayWakeUpView)
    }
    


}

// MARK: - setConstraints

extension SettingsViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            screenSettingsNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            screenSettingsNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            setTodayWakeUpView.topAnchor.constraint(equalTo: screenSettingsNameLabel.bottomAnchor, constant: 10),
            setTodayWakeUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            setTodayWakeUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            setTodayWakeUpView.heightAnchor.constraint(equalToConstant: 130)
            
        ])
    }
}
