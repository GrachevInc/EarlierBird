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
                                                  font: .specialRobotoBold20(),
                                                  textColor: .white)
    
    private let todayTimeWakeUpTextLabel = UILabel(text: "Просыпаюсь",
                                                  textAlignment: .center,
                                                  font: .specialRobotoBold18(),
                                                  textColor: .white)
    
    private let goalTimeWakeUpTextLabel = UILabel(text: "Цель",
                                                  textAlignment: .center,
                                                  font: .specialRobotoBold18(),
                                                  textColor: .white)
    
    private let intervalTimeWakeUpTextLabel = UILabel(text: "Интервал",
                                                  textAlignment: .center,
                                                  font: .specialRobotoBold18(),
                                                  textColor: .white)
    
    private let dateTimeWakeUpTextLabel = UILabel(text: "Дата",
                                                  textAlignment: .center,
                                                  font: .specialRobotoBold18(),
                                                  textColor: .white)
    
    private let setTodayTimeWakeUpButton: UIButton = .createDefaultTimeButton(image: "digitalDialFace",
                                                                              setTitle: "08:43",
                                                                              font: .specialTimeFont30())
    
    private let setGoalTimeWakeUpButton: UIButton = .createDefaultTimeButton(image: "digitalDialFaceTarget",
                                                                             setTitle: "06:00",
                                                                             font: .specialTimeFont30())
    
    private let setIntervalWakeUpButton: UIButton = .createDefaultTimeButton(image: "digitalDialFaceInterval",
                                                                             setTitle: "5 мин. 20 сек.",
                                                                             font: .specialRobotoBold18())
    
    private let setDateWakeUpButton: UIButton = .createDefaultTimeButton(image: "digitalDialFaceDate",
                                                                         setTitle: "25.05.2022",
                                                                         font: .specialRobotoBold20())
    
//    private let notificationButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.tintColor = .specialBlue
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Включить уведомления", for: .normal)
//        button.setTitleColor(.specialBlue, for: .normal)
//        button.setImage(UIImage(named: "notificationButton")?.withRenderingMode(.alwaysOriginal), for: .normal)
//        button.backgroundColor = .specialGreen
//        button.layer.cornerRadius = 10
//        button.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)
//        button.addShadowOnView()
//        return button
//    }()
    
    private var todayButtonStackView = UIStackView()
    private var goalButtonStackView = UIStackView()
    private var firstHorizontalStackView = UIStackView()
    
    private var intervalButtonStackView = UIStackView()
    private var dateButtonStackView = UIStackView()
    private var secondHorizontalStackView = UIStackView()
    
    private var generalGoalStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    @objc private func setTodayTimeWakeUpButtonTapped() {
        print("setTodayTimeWakeUpButtonTapped")
    }
    
    @objc private func setGoalTimeWakeUpButtonTapped() {
        print("setGoalTimeWakeUpButtonTapped")
    }
    
    @objc private func setIntervalWakeUpButtonTapped() {
        print("setIntervalWakeUpButtonTapped")
    }
    
    @objc private func setDateWakeUpButtonTapped() {
        print("setDateWakeUpButtonTapped")
    }
    
    @objc private func notificationButtonTapped() {
        print("notificationButtonTapped")
        
    }
    
    // MARK: - setupViews

    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(screenSettingsNameLabel)
        
        todayButtonStackView = UIStackView(arrangedSubviews: [todayTimeWakeUpTextLabel, setTodayTimeWakeUpButton],
                                           axis: .vertical,
                                           spacing: 5)
        
        goalButtonStackView = UIStackView(arrangedSubviews: [goalTimeWakeUpTextLabel, setGoalTimeWakeUpButton],
                                           axis: .vertical,
                                           spacing: 5)
        
        firstHorizontalStackView = UIStackView(arrangedSubviews: [todayButtonStackView, goalButtonStackView],
                                               axis: .horizontal,
                                               spacing: 10)
        
        
        intervalButtonStackView = UIStackView(arrangedSubviews: [intervalTimeWakeUpTextLabel, setIntervalWakeUpButton],
                                           axis: .vertical,
                                           spacing: 5)
        
        dateButtonStackView = UIStackView(arrangedSubviews: [dateTimeWakeUpTextLabel, setDateWakeUpButton],
                                          axis: .vertical,
                                          spacing: 5)
        
        secondHorizontalStackView = UIStackView(arrangedSubviews: [intervalButtonStackView, dateButtonStackView],
                                                axis: .horizontal,
                                                spacing: 10)
        
        
        generalGoalStackView = UIStackView(arrangedSubviews: [firstHorizontalStackView,
                                                              secondHorizontalStackView],
                                           axis: .vertical,
                                           spacing: 10)
        view.addSubview(generalGoalStackView)
        
        setTodayTimeWakeUpButton.addTarget(self, action: #selector(setTodayTimeWakeUpButtonTapped), for: .touchUpInside)
        setGoalTimeWakeUpButton.addTarget(self, action: #selector(setGoalTimeWakeUpButtonTapped), for: .touchUpInside)
        setIntervalWakeUpButton.addTarget(self, action: #selector(setIntervalWakeUpButtonTapped), for: .touchUpInside)
        setDateWakeUpButton.addTarget(self, action: #selector(setIntervalWakeUpButtonTapped), for: .touchUpInside)
        
//        view.addSubview(notificationButton)
    }
}

// MARK: - setConstraints

extension SettingsViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            screenSettingsNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            screenSettingsNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            generalGoalStackView.topAnchor.constraint(equalTo: screenSettingsNameLabel.bottomAnchor, constant: 20),
            generalGoalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            generalGoalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            generalGoalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
//            notificationButton.topAnchor.constraint(equalTo: generalGoalStackView.bottomAnchor, constant: 10),
//            notificationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            notificationButton.heightAnchor.constraint(equalToConstant: 120),
//            notificationButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
