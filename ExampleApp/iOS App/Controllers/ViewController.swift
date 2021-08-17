//
//  ViewController.swift
//
//  Created by Alexandr Guzenko on 17.08.2020.
//  Copyright © 2020. All rights reserved.
//

import UIKit
import SnapKit
import ALProgressView

class MainViewController: UIViewController {

    // MARK: - UIElements
    
    private lazy var progressRing = ALProgressRing()
    private lazy var progressBar = ALProgressBar()
    private lazy var titleLabel = UILabel()
    private lazy var subtitleLabel = UILabel()
    private lazy var emojiLabel = UILabel()
    private lazy var actionButton = UIButton()
    private lazy var animationButton = UIButton()
    
    // MARK: - Private Properties
    private var currentFunction: ALTimingFunction = .easeOutExpo
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupAction()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            progressRing.setProgress(0.8, animated: true)
            progressBar.setProgress(0.6, animated: true)
        }
    }
}

// MARK: - Handlers

private extension MainViewController {
    @objc func randomizeTapped() {
        let progress = Float.random(in: 0...1)
        progressRing.setProgress(progress, animated: true)
        progressBar.setProgress(progress, animated: true)
    }
}

// MARK: - Private Methods

private extension MainViewController {
    func setupAction() {
        actionButton.addTarget(self, action: #selector(randomizeTapped), for: .touchUpInside)
        animationButton.addTarget(self, action: #selector(presentTimingFunctions), for: .touchUpInside)
    }
    
    func updateTimingFunction(_ function: ALTimingFunction) {
        currentFunction = function
        progressRing.timingFunction = currentFunction
        progressBar.timingFunction = currentFunction
        animationButton.setTitle("Animation: ." + currentFunction.rawValue , for: .normal)
    }
}

// MARK: - Navigation

private extension MainViewController {
    @objc func presentTimingFunctions() {
        let vc = AnimationViewController(currentFunction: currentFunction)
        let navVC = UINavigationController(rootViewController: vc)
        
        vc.timingFunctionUpdated = { [weak self] function in
            self?.updateTimingFunction(function)
        }
        
        present(navVC, animated: true)
    }
}


// MARK: - Setup Layout

private extension MainViewController {
    func setupColors() {
        view.backgroundColor = .systemBackground
        titleLabel.textColor = .label
        subtitleLabel.textColor = .secondaryLabel
        actionButton.backgroundColor = .secondarySystemFill
        actionButton.setTitleColor(.systemPink, for: .normal)
        actionButton.setTitleColor(.systemPink.withAlphaComponent(0.7), for: .highlighted)
        
        animationButton.setTitleColor(.systemPink, for: .normal)
        animationButton.setTitleColor(.systemPink.withAlphaComponent(0.7), for: .highlighted)
    }
    
    func setupView() {
        setupColors()
        
        progressRing.lineWidth = 15
        
        emojiLabel.text = "✌️"
        emojiLabel.font = .systemFont(ofSize: 80, weight: .regular)
        
        titleLabel.text = "ALProgressView"
        titleLabel.font = .systemFont(ofSize: 32, weight: .bold)
        
        subtitleLabel.text = "Easy, simple, customizable"
        subtitleLabel.font = .systemFont(ofSize: 21, weight: .regular)
        
        actionButton.setTitle("Random progress", for: .normal)
        actionButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        actionButton.layer.cornerRadius = 12
        
        animationButton.setTitle("Animation: ." + currentFunction.rawValue , for: .normal)
        animationButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    func setupConstraints() {
        view.addSubview(progressRing)
        progressRing.addSubview(emojiLabel)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(progressBar)
        view.addSubview(actionButton)
        view.addSubview(animationButton)
        
        progressRing.snp.makeConstraints {
            $0.size.equalTo(180)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(70)
        }
        
        emojiLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(progressRing.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        progressBar.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(20)
            $0.width.equalTo(titleLabel)
            $0.height.equalTo(10)
            $0.centerX.equalToSuperview()
        }
        
        
        actionButton.snp.makeConstraints {
            $0.bottom.equalTo(animationButton.snp.top).offset(-10)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(50)
        }
        
        animationButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(35)
        }
    }
}
