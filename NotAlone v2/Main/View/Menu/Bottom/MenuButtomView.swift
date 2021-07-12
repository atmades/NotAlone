//
//  MenuButtomStackView.swift
//  NotAlone v2
//
//  Created by Максим on 28.01.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

protocol MenuButtomStackViewDelegate: AnyObject {
    func didMapTap()
    func didFiltersTap()
    func didSetingsTap()
}

class MenuButtomStackView: UIStackView {
    
    // MARK: - Appearance
    
    var viewModel = MenuButtomViewModel()
    weak var delegate: MenuButtomStackViewDelegate?
    
    //    MARK: - Buttons
   private lazy var mapButton: ButtonWithIcon = {
        let button = ButtonWithIcon(type: .system)
        button.setupMenuButton(with: viewModel.mapMenu)
        button.addTarget(self, action: #selector(mapPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var filtersButton: ButtonWithIcon = {
        let button = ButtonWithIcon(type: .system)
        button.setupMenuButton(with: viewModel.filtersMenu)
        button.addTarget(self, action: #selector(filtersPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var settingsButton: ButtonWithIcon = {
        let button = ButtonWithIcon(type: .system)
        button.setupMenuButton(with: viewModel.settingsMenu)
        button.addTarget(self, action: #selector(settingsPressed), for: .touchUpInside)
        return button
    }()
    
    //    MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @objc func mapPressed(_ sender: UIButton) {
        delegate?.didMapTap()
    }
    
    @objc func filtersPressed(_ sender: UIButton) {
        delegate?.didFiltersTap()
    }
    
    @objc func settingsPressed(_ sender: UIButton) {
        delegate?.didSetingsTap()
    }
    
    //    MARK: - Loyaut
    private func setupStackView() {
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fillEqually
        axis = .vertical
        backgroundColor = .clear
        spacing = 10
        
        [mapButton, filtersButton, settingsButton].forEach { (button) in
             addArrangedSubview(button)
         }
    }
}
