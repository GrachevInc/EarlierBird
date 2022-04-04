//
//  BriefProgressStatistic.swift
//  EarlierBird
//
//  Created by Konstantin Gracheff on 26.02.2022.
//

import UIKit

class BriefProgressStatisticView: UIView {
    
    enum Constants {
        enum ProgressView{
            static let calendarIconDistanceToTopEdge: CGFloat = 10
            static let calendarIconHeightWidth: CGFloat = 60
            static let textDistanceToTopEdge: CGFloat = 20
            static let progressViewHeight: CGFloat = 20
            static let progressViewDistanceToTopEdge: CGFloat = 15
            static let progressIconsHeightWidth: CGFloat = 35
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
                                              font: .specialRobotoMedium16(),
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
                                                           constant: Constants.ProgressView.calendarIconDistanceToTopEdge),
            calendarProgressImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            calendarProgressImageView.widthAnchor.constraint(equalToConstant: Constants.ProgressView.calendarIconHeightWidth),
            calendarProgressImageView.heightAnchor.constraint(equalToConstant: Constants.ProgressView.calendarIconHeightWidth)
        ])
        
        NSLayoutConstraint.activate([
            textCalendarProgressLabel.topAnchor.constraint(equalTo: topAnchor,
                                                           constant: Constants.ProgressView.textDistanceToTopEdge),
            textCalendarProgressLabel.leadingAnchor.constraint(equalTo: calendarProgressImageView.trailingAnchor,
                                                               constant: MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            textCalendarProgressLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                                constant: -MainConstants.ContraintsSize.defaultDisctanceToSideEdge)
        ])
        
        NSLayoutConstraint.activate([
            briefProgressView.heightAnchor.constraint(equalToConstant: Constants.ProgressView.progressViewHeight),
            briefProgressView.topAnchor.constraint(equalTo: textCalendarProgressLabel.bottomAnchor,
                                                   constant: Constants.ProgressView.progressViewDistanceToTopEdge),
            briefProgressView.leadingAnchor.constraint(equalTo: startProgressImageView.trailingAnchor,
                                                       constant: MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            briefProgressView.trailingAnchor.constraint(equalTo: finishProgressImageView.leadingAnchor,
                                                        constant: -MainConstants.ContraintsSize.defaultDisctanceToSideEdge)
        ])
        
        NSLayoutConstraint.activate([
            startProgressImageView.centerYAnchor.constraint(equalTo: briefProgressView.centerYAnchor),
            startProgressImageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                            constant: MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            startProgressImageView.heightAnchor.constraint(equalToConstant: Constants.ProgressView.progressIconsHeightWidth),
            startProgressImageView.widthAnchor.constraint(equalToConstant: Constants.ProgressView.progressIconsHeightWidth)
        ])
        
        NSLayoutConstraint.activate([
            finishProgressImageView.centerYAnchor.constraint(equalTo: briefProgressView.centerYAnchor),
            finishProgressImageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                              constant: -MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            finishProgressImageView.heightAnchor.constraint(equalToConstant: Constants.ProgressView.progressIconsHeightWidth),
            finishProgressImageView.widthAnchor.constraint(equalToConstant: Constants.ProgressView.progressIconsHeightWidth)
        ])
    }
}
