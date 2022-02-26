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
        imageView.image = UIImage(named: "calendarBriefStatistic")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textCalendarProgressLabel = UILabel(text: "До результата осталось 14 дней. Каждый день ты просыпаешься на 4 минуты раньше",
                                              textAlignment: .left,
                                              font: .specialRobotoMedium14(),
                                              textColor: .white)
    
    private let briefProgressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .specialRed
        progressView.progressTintColor = .specialPink
        progressView.setProgress(0.3, animated: true)
        progressView.layer.sublayers?[1].cornerRadius = 10
        progressView.subviews[1].clipsToBounds = true
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private let startProgressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "startImage")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let finishProgressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "finishImage")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var briefProgressViewStackView = UIStackView()
        
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
        addSubview(startProgressImageView)
        addSubview(briefProgressView)
        addSubview(finishProgressImageView)
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
            textCalendarProgressLabel.leadingAnchor.constraint(equalTo: calendarProgressImageView.trailingAnchor, constant: 20),
            textCalendarProgressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            startProgressImageView.topAnchor.constraint(equalTo: calendarProgressImageView.bottomAnchor, constant: 15),
            startProgressImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            startProgressImageView.heightAnchor.constraint(equalToConstant: 30),
            startProgressImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            finishProgressImageView.topAnchor.constraint(equalTo: calendarProgressImageView.bottomAnchor, constant: 15),
            finishProgressImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            finishProgressImageView.heightAnchor.constraint(equalToConstant: 30),
            finishProgressImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            briefProgressView.centerYAnchor.constraint(equalTo: startProgressImageView.centerYAnchor),
            briefProgressView.leadingAnchor.constraint(equalTo: startProgressImageView.trailingAnchor, constant: 10),
            briefProgressView.trailingAnchor.constraint(equalTo: finishProgressImageView.leadingAnchor, constant: -10),
            briefProgressView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
