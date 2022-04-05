//
//  BriefProgressStatistic.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 26.02.2022.
//

import UIKit

class BriefProgressStatisticView: UIView {
    
    enum Constants {
        enum ConstraintsProgressView {
            static let calendarIconDistanceToTopEdge: CGFloat = 10
            static let calendarIconHeightWidth: CGFloat = 60
            static let textDistanceToTopEdge: CGFloat = 20
            static let progressViewHeight: CGFloat = 20
            static let progressViewDistanceToTopEdge: CGFloat = 15
            static let progressIconsHeightWidth: CGFloat = 35
        }
        
        enum Fonts {
            static let fontTextCalendarProgressLabel = UIFont.specialRobotoMedium16()
        }
        
    }
    
    private let calendarProgressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendarBriefStatistic")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textCalendarProgressLabel = UILabel(text: "До результата осталось 14 дней. Каждый день ты просыпаешься на 4 минуты раньше",
                                              textAlignment: .left,
                                                    font: Constants.Fonts.fontTextCalendarProgressLabel,
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
    
    private let startProgressImageView:  UIImageView = .createDefault(named: "startImage")
    private let finishProgressImageView: UIImageView = .createDefault(named: "finishImage")
        
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
        
        addSubview(calendarProgressImageView)
        
        textCalendarProgressLabel.numberOfLines = 3
        addSubview(textCalendarProgressLabel)
        addSubview(startProgressImageView)
        addSubview(briefProgressView)
        addSubview(finishProgressImageView)
    }
    
    // MARK: - setConstraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            calendarProgressImageView.topAnchor.constraint(equalTo: topAnchor,
                                                           constant: Constants.ConstraintsProgressView.calendarIconDistanceToTopEdge),
            calendarProgressImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            calendarProgressImageView.widthAnchor.constraint(equalToConstant: Constants.ConstraintsProgressView.calendarIconHeightWidth),
            calendarProgressImageView.heightAnchor.constraint(equalToConstant: Constants.ConstraintsProgressView.calendarIconHeightWidth)
        ])
        
        NSLayoutConstraint.activate([
            textCalendarProgressLabel.topAnchor.constraint(equalTo: topAnchor,
                                                           constant: Constants.ConstraintsProgressView.textDistanceToTopEdge),
            textCalendarProgressLabel.leadingAnchor.constraint(equalTo: calendarProgressImageView.trailingAnchor,
                                                               constant: MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            textCalendarProgressLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                                constant: -MainConstants.ContraintsSize.defaultDisctanceToSideEdge)
        ])
        
        NSLayoutConstraint.activate([
            briefProgressView.heightAnchor.constraint(equalToConstant: Constants.ConstraintsProgressView.progressViewHeight),
            briefProgressView.topAnchor.constraint(equalTo: textCalendarProgressLabel.bottomAnchor,
                                                   constant: Constants.ConstraintsProgressView.progressViewDistanceToTopEdge),
            briefProgressView.leadingAnchor.constraint(equalTo: startProgressImageView.trailingAnchor,
                                                       constant: MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            briefProgressView.trailingAnchor.constraint(equalTo: finishProgressImageView.leadingAnchor,
                                                        constant: -MainConstants.ContraintsSize.defaultDisctanceToSideEdge)
        ])
        
        NSLayoutConstraint.activate([
            startProgressImageView.centerYAnchor.constraint(equalTo: briefProgressView.centerYAnchor),
            startProgressImageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                            constant: MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            startProgressImageView.heightAnchor.constraint(equalToConstant: Constants.ConstraintsProgressView.progressIconsHeightWidth),
            startProgressImageView.widthAnchor.constraint(equalToConstant: Constants.ConstraintsProgressView.progressIconsHeightWidth)
        ])
        
        NSLayoutConstraint.activate([
            finishProgressImageView.centerYAnchor.constraint(equalTo: briefProgressView.centerYAnchor),
            finishProgressImageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                              constant: -MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            finishProgressImageView.heightAnchor.constraint(equalToConstant: Constants.ConstraintsProgressView.progressIconsHeightWidth),
            finishProgressImageView.widthAnchor.constraint(equalToConstant: Constants.ConstraintsProgressView.progressIconsHeightWidth)
        ])
    }
}
