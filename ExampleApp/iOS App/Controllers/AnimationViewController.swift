//
//  AnimationViewController.swift
//  iOS App
//
//  Created by Alexandr Guzenko on 17.08.2021.
//  Copyright © 2021 alxrguz. All rights reserved.
//

import UIKit
import ALProgressView

final class AnimationViewController: UITableViewController {
    // MARK: - UI Elements
    
    private lazy var closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissController))
    
    // MARK: - Public Proporties
    var timingFunctionUpdated: ((ALTimingFunction) -> Void)?
    
    // MARK: - Private Proporties
    private let currentFunction: ALTimingFunction
    
    // MARK: - Life cycle
    init(currentFunction: ALTimingFunction) {
        self.currentFunction = currentFunction
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Handlers
private extension AnimationViewController {
    @objc func dismissController() {
        dismiss(animated: true)
    }
}

// MARK: - Open Methods
extension AnimationViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ALTimingFunction.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let data = ALTimingFunction.allCases[indexPath.row]
        cell.textLabel?.text = data.rawValue
        cell.accessoryType = data == currentFunction  ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = ALTimingFunction.allCases[indexPath.row]
        timingFunctionUpdated?(data)
        dismissController()
    }
}


// MARK: - Layout Setup
private extension AnimationViewController {
    func setupView() {
        navigationItem.title = "Timing Function"
        navigationItem.rightBarButtonItem = closeButton
        
        tableView.tintColor = .systemPink
    }
}

