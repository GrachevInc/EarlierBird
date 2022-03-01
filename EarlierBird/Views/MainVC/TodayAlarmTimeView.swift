//
//  TodayAlarmTimeView.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 26.02.2022.
//

import UIKit

class TodayAlarmTimeView: UIView {
    
    private let textTodayAlarmLabel = UILabel(text: "Будильник сегодня",
                                              textAlignment: .center,
                                              font: .specialRobotoBold18(),
                                              textColor: .white)

    private let digitalDialFaceImageView: UIImageView = .createDefault(named: "digitalDialFace")
    
    private let timeTodayAlarmLabel = UILabel(text: "07:28",
                                              textAlignment: .center,
                                              font: .specialTimeFont30(),
                                              textColor: .specialBlue)
    
    
    
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        setStandartViewSettings()
        addShadowOnView()
        addSubview(textTodayAlarmLabel)
        addSubview(digitalDialFaceImageView)
        addSubview(timeTodayAlarmLabel)
        addSubview(isOnAlarmSwitch)
        
    }
}

// MARK: - @objc func

extension TodayAlarmTimeView {

    @objc private func isOnAlarmSwitched() {
        print("Switcher works")
    }
}

// MARK: - setConstraints

extension TodayAlarmTimeView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            textTodayAlarmLabel.topAnchor.constraint(equalTo: topAnchor,
                                                     constant: Constants.ContraintsSize.defaultDistanceToTopEdge),
            textTodayAlarmLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.ContraintsSize.defaultDisctanceToSideEdge),
            textTodayAlarmLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.ContraintsSize.defaultDisctanceToSideEdge)
        ])
        
        NSLayoutConstraint.activate([
            digitalDialFaceImageView.topAnchor.constraint(equalTo: textTodayAlarmLabel.bottomAnchor,
                                                          constant: Constants.TodayAlarmView.digitalDialFaceIconToTopEdge),
            digitalDialFaceImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            digitalDialFaceImageView.heightAnchor.constraint(equalToConstant: Constants.TodayAlarmView.digitalDialFaceIconHeight)
        ])
        
        NSLayoutConstraint.activate([
            timeTodayAlarmLabel.centerYAnchor.constraint(equalTo: digitalDialFaceImageView.centerYAnchor),
            timeTodayAlarmLabel.leadingAnchor.constraint(equalTo: digitalDialFaceImageView.leadingAnchor,
                                                         constant: Constants.ContraintsSize.defaultDisctanceToSideEdge),
            timeTodayAlarmLabel.trailingAnchor.constraint(equalTo: digitalDialFaceImageView.trailingAnchor,
                                                          constant: -Constants.ContraintsSize.defaultDisctanceToSideEdge)
        ])
        
        NSLayoutConstraint.activate([
            isOnAlarmSwitch.centerYAnchor.constraint(equalTo: digitalDialFaceImageView.centerYAnchor),
            isOnAlarmSwitch.leadingAnchor.constraint(equalTo: digitalDialFaceImageView.trailingAnchor,
                                                     constant: Constants.ContraintsSize.defaultDisctanceToSideEdge)
        ])
    }
}
