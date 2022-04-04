//
//  ViewController.swift
//  ErlierBird
//
//  Created by Konstantin Gracheff on 24.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    enum Constants {
        enum MainViewController {
            static let timeLabelStackViewSpacing: CGFloat = -13
            static let timeLabelStackViewWidth: CGFloat = 130
            static let goalImageHeightMultiplier: CGFloat = 0.9
        }
    }
    
    private let goalImageView: UIImageView = .createDefault(named: "goal")
    
    private let textTimeLabel = UILabel(text: "Просыпаться в",
                                        textAlignment: .center,
                                        font: .specialRobotoMedium30(),
                                        textColor: .specialBlue)
    
    private let timeLabel = UILabel(text: "06:55",
                                    textAlignment: .center,
                                    font: .specialTimeFont46(),
                                    textColor: .specialBlue)
    
    private var timeLabelStackView = UIStackView()
    
    private let todayAlarmTimeView = TodayAlarmTimeView()
    private let briefProgressStatisticView = BriefProgressStatisticView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    // MARK: - setupViews

    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(goalImageView)
        
        timeLabelStackView = .init(arrangedSubviews: [textTimeLabel, timeLabel],
                                   axis: .vertical,
                                   spacing: Constants.MainViewController.timeLabelStackViewSpacing)
        timeLabelStackView.distribution = .equalCentering
        view.addSubview(timeLabelStackView)
        
        view.addSubview(todayAlarmTimeView)
        view.addSubview(briefProgressStatisticView)
    }
    
    @objc private func settingsButtonTapped() {
        print("settingsButtonTapped")
    }

}

// MARK: - setConstraints

extension MainViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            goalImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                               constant: MainConstants.ContraintsSize.defaultDistanceToTopSafeAreaEdge),
            goalImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goalImageView.heightAnchor.constraint(equalTo: view.widthAnchor,
                                                  multiplier: Constants.MainViewController.goalImageHeightMultiplier)
        ])
        
        NSLayoutConstraint.activate([
            timeLabelStackView.centerYAnchor.constraint(equalTo: goalImageView.centerYAnchor),
            timeLabelStackView.centerXAnchor.constraint(equalTo: goalImageView.centerXAnchor),
            timeLabelStackView.widthAnchor.constraint(equalToConstant: Constants.MainViewController.timeLabelStackViewWidth)
        ])
        
        NSLayoutConstraint.activate([
            todayAlarmTimeView.topAnchor.constraint(equalTo: goalImageView.bottomAnchor,
                                                    constant: MainConstants.ContraintsSize.defaultDistanceBetweenViews),
            todayAlarmTimeView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                        constant: MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            todayAlarmTimeView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                         constant: -MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            todayAlarmTimeView.heightAnchor.constraint(equalToConstant: MainConstants.ContraintsSize.defaultViewHeight)
        ])
        
        NSLayoutConstraint.activate([
            briefProgressStatisticView.topAnchor.constraint(equalTo: todayAlarmTimeView.bottomAnchor,
                                                            constant:  MainConstants.ContraintsSize.defaultDistanceBetweenViews),
            briefProgressStatisticView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                                constant: MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            briefProgressStatisticView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                                 constant: -MainConstants.ContraintsSize.defaultDisctanceToSideEdge),
            briefProgressStatisticView.heightAnchor.constraint(equalToConstant: MainConstants.ContraintsSize.defaultViewHeight)
        ])
    }
}
