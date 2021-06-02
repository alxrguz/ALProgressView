//
//  ViewController.swift
//
//  Created by Alexandr Guzenko on 17.08.2020.
//  Copyright © 2020. All rights reserved.
//

import UIKit
import ALProgressView

class MainViewController: UIViewController {

    // MARK: - UIElements
    
    private lazy var progressRing = ALProgressRing()
    private lazy var progressBar = ALProgressBar()
    private lazy var titleLabel = UILabel()
    private lazy var subtitleLabel = UILabel()
    private lazy var emojiLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}

// MARK: - Setup Layout

private extension MainViewController {
    func setupColors() {
        view.backgroundColor = .systemBackground
        titleLabel.textColor = .label
        subtitleLabel.textColor = .secondaryLabel
    }
    
    func setupView() {
        setupColors()
        
        progressRing.lineWidth = 15
        progressRing.setProgress(0.8, animated: true)
        
        progressBar.setProgress(0.6, animated: true)
        
        
        emojiLabel.text = "✌️"
        emojiLabel.font = .systemFont(ofSize: 80, weight: .regular)
        
        titleLabel.text = "ALProgressView"
        titleLabel.font = .systemFont(ofSize: 32, weight: .bold)
        
        subtitleLabel.text = "Easy, simple, customizable"
        subtitleLabel.font = .systemFont(ofSize: 21, weight: .regular)
    }
    
    func setupConstraints() {
        view.addSubview(progressRing)
        progressRing.addSubview(emojiLabel)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(progressBar)
        
        progressRing.translatesAutoresizingMaskIntoConstraints = false
        progressRing.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressRing.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        progressRing.widthAnchor.constraint(equalToConstant: 180).isActive = true
        progressRing.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.centerXAnchor.constraint(equalTo: progressRing.centerXAnchor).isActive = true
        emojiLabel.centerYAnchor.constraint(equalTo: progressRing.centerYAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: progressRing.bottomAnchor, constant: 40).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20).isActive = true
        progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressBar.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
    }
}
