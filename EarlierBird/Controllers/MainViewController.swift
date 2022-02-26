//
//  ViewController.swift
//  ErlierBird
//
//  Created by Konstantin Gracheff on 24.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "settings"), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let goalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "goal")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Просыпаться в"
        label.textAlignment = .center
        label.font = .specialRobotoMedium30()
        label.textColor = .specialBlue
        label.adjustsFontSizeToFitWidth = true
        return label
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
    
    private let todayAlarmTimeView = TodayAlarmTimeView()
    private let briefProgressStatisticView = BriefProgressStatisticView()
    
    private var timeLabelStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    //MARK: – setupViews

    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(goalImageView)
        view.addSubview(settingsButton)
        
        timeLabelStackView = .init(arrangedSubviews: [textTimeLabel, timeLabel],
                                   axis: .vertical,
                                   spacing: -10)
        view.addSubview(timeLabelStackView)
        view.addSubview(todayAlarmTimeView)
        view.addSubview(briefProgressStatisticView)
    }
    
    @objc private func settingsButtonTapped() {
        print("settingsButtonTapped")
    }

}

//MARK: – setDelegates

extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            settingsButton.heightAnchor.constraint(equalToConstant: 60),
            settingsButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            goalImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            goalImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goalImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        
        NSLayoutConstraint.activate([
            timeLabelStackView.centerYAnchor.constraint(equalTo: goalImageView.centerYAnchor),
            timeLabelStackView.centerXAnchor.constraint(equalTo: goalImageView.centerXAnchor),
            timeLabelStackView.widthAnchor.constraint(equalToConstant: 130)
        ])
        
        NSLayoutConstraint.activate([
            todayAlarmTimeView.topAnchor.constraint(equalTo: goalImageView.bottomAnchor, constant: 10),
            todayAlarmTimeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            todayAlarmTimeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            todayAlarmTimeView.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        NSLayoutConstraint.activate([
            briefProgressStatisticView.topAnchor.constraint(equalTo: todayAlarmTimeView.bottomAnchor, constant: 10),
            briefProgressStatisticView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            briefProgressStatisticView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            briefProgressStatisticView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
}
