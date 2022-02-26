//
//  TodayAlarmTimeView.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 26.02.2022.
//

import UIKit

class TodayAlarmTimeView: UIView {
    
    private let textTodayAlarmLabel = UILabel(text: "Сегодня будильник установлен на",
                                              textAlignment: .center,
                                              font: .specialRobotoMedium14(),
                                              textColor: .white)

    private let digitalDialFaceImageView: UIImageView = .createDefault(named: "digitalDialFace")
    
    private let timeTodayAlarmLabel = UILabel(text: "07:28",
                                              textAlignment: .center,
                                              font: .specialTimeFont30(),
                                              textColor: .specialBlue)
    
    private let expectedWeatherImageView = UIImageView(defaultNamed: "cloudy")
    
    private let expectedWeatherLabel = UILabel(text: "Ожидается",
                                        textAlignment: .center,
                                        font: .specialRobotoMedium14(),
                                        textColor: .white)
    
    private let expectedWeatherDescriptionLabel = UILabel(text: "Дождь 5°С",
                                                          textAlignment: .center,
                                                          font: .specialRobotoMedium12(),
                                                          textColor: .white)
    
    private let isOnAlarmSwitch: UISwitch = {
        let alarmSwitch = UISwitch()
        alarmSwitch.translatesAutoresizingMaskIntoConstraints = false
        alarmSwitch.onTintColor = .specialRed
        alarmSwitch.backgroundColor = .specialBackground
        alarmSwitch.layer.cornerRadius = alarmSwitch.frame.height / 2
        alarmSwitch.thumbTintColor = .specialPink
        alarmSwitch.isOn = true
        alarmSwitch.addTarget(self, action: #selector(isOnAlarmSwitched), for: .valueChanged)
        return alarmSwitch
    }()
    
    private var expectedWeatherTextStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func isOnAlarmSwitched() {
        print("Switcher works")
    }
    
    private func setupViews() {
        setStandartViewSettings()
        addShadowOnView()
        addSubview(textTodayAlarmLabel)
        addSubview(digitalDialFaceImageView)
        addSubview(timeTodayAlarmLabel)
        
        expectedWeatherTextStackView = .init(arrangedSubviews: [expectedWeatherLabel,
                                                                expectedWeatherDescriptionLabel],
                                             axis: .vertical,
                                             spacing: 0)
        addSubview(expectedWeatherTextStackView)
        addSubview(expectedWeatherImageView)
        addSubview(isOnAlarmSwitch)
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            textTodayAlarmLabel.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            textTodayAlarmLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textTodayAlarmLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            digitalDialFaceImageView.topAnchor.constraint(equalTo: textTodayAlarmLabel.bottomAnchor, constant: 3),
            digitalDialFaceImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            digitalDialFaceImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            timeTodayAlarmLabel.centerYAnchor.constraint(equalTo: digitalDialFaceImageView.centerYAnchor),
            timeTodayAlarmLabel.leadingAnchor.constraint(equalTo: digitalDialFaceImageView.leadingAnchor, constant: 10),
            timeTodayAlarmLabel.trailingAnchor.constraint(equalTo: digitalDialFaceImageView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            expectedWeatherImageView.topAnchor.constraint(equalTo: textTodayAlarmLabel.bottomAnchor, constant: 8),
            expectedWeatherImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            expectedWeatherImageView.trailingAnchor.constraint(equalTo: digitalDialFaceImageView.leadingAnchor, constant: -20),
            expectedWeatherImageView.heightAnchor.constraint(equalToConstant: 60),
            expectedWeatherImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            expectedWeatherTextStackView.topAnchor.constraint(equalTo: expectedWeatherImageView.bottomAnchor, constant: 0),
            expectedWeatherTextStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            expectedWeatherTextStackView.trailingAnchor.constraint(equalTo: digitalDialFaceImageView.leadingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            isOnAlarmSwitch.centerYAnchor.constraint(equalTo: digitalDialFaceImageView.centerYAnchor),
            isOnAlarmSwitch.leadingAnchor.constraint(equalTo: digitalDialFaceImageView.trailingAnchor, constant: 20)
        ])
    }
    
}
