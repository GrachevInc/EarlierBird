//
//  SetTodayWakeUpView.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 26.02.2022.
//

import UIKit

class SetTodayWakeUpView: UIView {
    
    private let todayWakeUpTextLabel = UILabel(text: "Сейчас я просыпаюсь в",
                                               textAlignment: .left,
                                               font: .specialRobotoBold16(),
                                               textColor: .white)
    
    private let todayDigitalDialFaceImageView: UIImageView = .createDefault(named: "digitalDialFace")
    
    private let changeTodayWakeUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Изменить", for: .normal)
        button.setTitleColor(.specialGray, for: .normal)
        button.titleLabel?.font = .specialRobotoMedium14()
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(changeTodayWakeUpButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    private let changeTodayWakeUpLabel = UILabel(text: "Изменить",
//                                               textAlignment: .center,
//                                               font: .specialRobotoMedium14(),
//                                               textColor: .specialGray)
    
    private let timeTodayWakeUpAlarmLabel = UILabel(text: "10:28",
                                              textAlignment: .center,
                                              font: .specialTimeFont30(),
                                              textColor: .specialBlue)
    
    private let todayWakeUpTextDescriptionLabel = UILabel(text: """
Для одних это уже очень поздно, а для других это уже слишком рано.
Рекомендуем стараться просыпаться раньше!
""",
                                               textAlignment: .left,
                                               font: .specialRobotoMedium14(),
                                               textColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func changeTodayWakeUpButtonTapped() {
        print("changeTodayWakeUpButtonTapped")
    }
    
    // MARK: - setupViews
    private func setupViews() {
        setStandartViewSettings()
        addSubview(todayWakeUpTextLabel)
        addSubview(todayDigitalDialFaceImageView)
        addSubview(timeTodayWakeUpAlarmLabel)
        todayWakeUpTextDescriptionLabel.numberOfLines = 0
        addSubview(todayWakeUpTextDescriptionLabel)
        addSubview(changeTodayWakeUpButton)
    }
}

// MARK: - setupViews

extension SetTodayWakeUpView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            todayWakeUpTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            todayWakeUpTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            todayDigitalDialFaceImageView.topAnchor.constraint(equalTo: todayWakeUpTextLabel.bottomAnchor, constant: 3),
            todayDigitalDialFaceImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            todayDigitalDialFaceImageView.widthAnchor.constraint(equalToConstant: 130),
            todayDigitalDialFaceImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            timeTodayWakeUpAlarmLabel.centerXAnchor.constraint(equalTo: todayDigitalDialFaceImageView.centerXAnchor),
            timeTodayWakeUpAlarmLabel.centerYAnchor.constraint(equalTo: todayDigitalDialFaceImageView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            changeTodayWakeUpButton.topAnchor.constraint(equalTo: todayDigitalDialFaceImageView.bottomAnchor, constant: -7),
            changeTodayWakeUpButton.centerXAnchor.constraint(equalTo: todayDigitalDialFaceImageView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            todayWakeUpTextDescriptionLabel.centerYAnchor.constraint(equalTo: todayDigitalDialFaceImageView.centerYAnchor),
            todayWakeUpTextDescriptionLabel.leadingAnchor.constraint(equalTo: todayDigitalDialFaceImageView.trailingAnchor, constant: 10),
            todayWakeUpTextDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
}
