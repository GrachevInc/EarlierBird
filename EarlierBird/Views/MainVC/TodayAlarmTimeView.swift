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
                                              font: .specialRobotoMedium22(),
                                              textColor: .white)

    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setStandartViewSettings()
        addShadowOnView()
        addSubview(textTodayAlarmLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            textTodayAlarmLabel.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            textTodayAlarmLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textTodayAlarmLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
}
