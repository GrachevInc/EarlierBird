//
//  SettingsViewController.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 26.02.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    enum Constants {
        enum SettingsController {
            static let spacingHorizontalStackView: CGFloat = 10
            static let spacingVerticalStackView: CGFloat = 5
            static let spacingGeneralStackView: CGFloat = 10
            static let notificationButtonHeight: CGFloat = 45
        }
    }
    
    private let screenSettingsNameLabel = UILabel(text: "НАСТРОЙКИ",
                                                  font: .specialRobotoBold24())
    
    private let todayTimeWakeUpTextLabel = UILabel(text: "Просыпаюсь в")
    
    private let goalTimeWakeUpTextLabel = UILabel(text: "Цель")
    
    private let intervalTimeWakeUpTextLabel = UILabel(text: "Интервал")
    
    private let dateTimeWakeUpTextLabel = UILabel(text: "Дата")
    
    private lazy var setTodayTimeWakeUpButton: UIButton = {.createDefaultTimeButton(image: "digitalDialFace",
                                                                              setTitle: "08:43",
                                                                                    font: .specialTimeFont30(), target: self, action: #selector(setTodayTimeWakeUpButtonTapped))}()
    
    private lazy var setGoalTimeWakeUpButton: UIButton = {.createDefaultTimeButton(image: "digitalDialFaceTarget",
                                                                             setTitle: "06:00",
                                                                             font: .specialTimeFont30(), target: self, action: #selector(setTodayTimeWakeUpButtonTapped))}()
    
    private lazy var setIntervalWakeUpButton: UIButton = {.createDefaultTimeButton(image: "digitalDialFaceInterval",
                                                                             setTitle: "5 мин. 20 сек.",
                                                                             font: .specialRobotoBold18(), target: self, action: #selector(setTodayTimeWakeUpButtonTapped))}()
    
    private lazy var setDateWakeUpButton: UIButton = {.createDefaultTimeButton(image: "digitalDialFaceDate",
                                                                         setTitle: "25.05.2022",
                                                                         font: .specialRobotoBold20(), target: self, action: #selector(setTodayTimeWakeUpButtonTapped))}()
    
    private lazy var notificationButton: UIButton = {.createDefaultButton(image: "notificationButton",
                                                                     setTitle: "Включить уведомления",
                                                                     target: self,
                                                                     action: #selector(notificationButtonTapped))
        
    }()
    
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
    
    // MARK: - setupViews

    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(screenSettingsNameLabel)
        
        todayButtonStackView = UIStackView(arrangedSubviews: [todayTimeWakeUpTextLabel, setTodayTimeWakeUpButton],
                                           axis: .vertical,
                                           spacing: Constants.SettingsController.spacingVerticalStackView)
        
        goalButtonStackView = UIStackView(arrangedSubviews: [goalTimeWakeUpTextLabel, setGoalTimeWakeUpButton],
                                           axis: .vertical,
                                           spacing: Constants.SettingsController.spacingVerticalStackView)
        
        firstHorizontalStackView = UIStackView(arrangedSubviews: [todayButtonStackView, goalButtonStackView],
                                               axis: .horizontal,
                                               spacing: Constants.SettingsController.spacingHorizontalStackView)
        
        
        intervalButtonStackView = UIStackView(arrangedSubviews: [intervalTimeWakeUpTextLabel, setIntervalWakeUpButton],
                                           axis: .vertical,
                                           spacing: Constants.SettingsController.spacingVerticalStackView)
        
        dateButtonStackView = UIStackView(arrangedSubviews: [dateTimeWakeUpTextLabel, setDateWakeUpButton],
                                          axis: .vertical,
                                          spacing: Constants.SettingsController.spacingVerticalStackView)
        
        secondHorizontalStackView = UIStackView(arrangedSubviews: [intervalButtonStackView, dateButtonStackView],
                                                axis: .horizontal,
                                                spacing: Constants.SettingsController.spacingHorizontalStackView)
        
        
        generalGoalStackView = UIStackView(arrangedSubviews: [firstHorizontalStackView,
                                                              secondHorizontalStackView],
                                           axis: .vertical,
                                           spacing: Constants.SettingsController.spacingGeneralStackView)
        generalGoalStackView.layer.cornerRadius = MainConstants.CornerRadius.defaultCornerRadius
        view.addSubview(generalGoalStackView)
    
        view.addSubview(notificationButton)
    }
}

// MARK: - @objc func

extension SettingsViewController {
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
}

// MARK: - setConstraints

extension SettingsViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            screenSettingsNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                         constant: MainConstants.ContraintsSize.defaultDistanceToTopSafeAreaEdge),
            screenSettingsNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            generalGoalStackView.topAnchor.constraint(equalTo: screenSettingsNameLabel.bottomAnchor,
                                                      constant: MainConstants.ContraintsSize.defaultDistanceBetweenViews),
            generalGoalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            generalGoalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                          constant: MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            generalGoalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                           constant: -MainConstants.ContraintsSize.defaultDisctanceToSideEdge)
        ])
        
        NSLayoutConstraint.activate([
            notificationButton.topAnchor.constraint(equalTo: generalGoalStackView.bottomAnchor,
                                                    constant: MainConstants.ContraintsSize.defaultDistanceBetweenViews),
            notificationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            notificationButton.heightAnchor.constraint(equalToConstant: Constants.SettingsController.notificationButtonHeight)
        ])
    }
}
