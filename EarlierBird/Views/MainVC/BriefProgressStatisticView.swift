//
//  BriefProgressStatistic.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 26.02.2022.
//

import UIKit

class BriefProgressStatisticView: UIView {
    
    private let calendarProgressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "resultImage")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textCalendarProgressLabel = UILabel(text: "До результата осталось 14 дней. Каждый день ты просыпаешься на 4 минуты раньше",
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
    
    private func setupViews() {
        setStandartViewSettings()
        addShadowOnView()
        
        addSubview(calendarProgressImageView)
        
        textCalendarProgressLabel.numberOfLines = 3
        addSubview(textCalendarProgressLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            calendarProgressImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            calendarProgressImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            calendarProgressImageView.widthAnchor.constraint(equalToConstant: 60),
            calendarProgressImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            textCalendarProgressLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            textCalendarProgressLabel.leadingAnchor.constraint(equalTo: calendarProgressImageView.trailingAnchor, constant: 10),
            textCalendarProgressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
}
