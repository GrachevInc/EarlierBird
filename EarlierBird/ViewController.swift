//
//  ViewController.swift
//  ErlierBird
//
//  Created by Konstantin Gracheff on 24.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "settings"), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let goalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "goal")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "05:38"
        label.textAlignment = .center
        label.font = .specialTimeFont46()
        label.textColor = .specialBlue
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    //MARK: – setupViews

    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(goalImageView)
        view.addSubview(settingsButton)
        view.addSubview(timeLabel)
    }
    
    @objc private func settingsButtonTapped() {
        print("settingsButtonTapped")
    }

}

//MARK: – setDelegates

extension ViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            settingsButton.heightAnchor.constraint(equalToConstant: 60),
            settingsButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            goalImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            goalImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goalImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.centerYAnchor.constraint(equalTo: goalImageView.centerYAnchor),
            timeLabel.centerXAnchor.constraint(equalTo: goalImageView.centerXAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
}
