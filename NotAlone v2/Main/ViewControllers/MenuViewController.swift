//
//  MenuViewController.swift
//  NotAlone v2
//
//  Created by Максим on 28.01.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate: AnyObject {
    func toProfilePressed()
    func createNewEvent()
    func avatarPressed()
    
    func toMapPressed()
    func toFiltersPressed()
    func toSettingsPressed()
}

class MenuViewController: UIViewController {
    
    // MARK: - Appearance
    let viewModel: MenuViewModel = MenuViewModel()
    weak var delegate: MenuViewControllerDelegate?
    
    var buttonStackView: MenuButtomStackView = MenuButtomStackView()
    var topConteinerView: MenuTopView = MenuTopView()
    var topConteinerViewLoggined: MenuTopViewLoggined = MenuTopViewLoggined()
    
    //    MARK: - Menu Container Views
    
//    Container for Content of Menu
   private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .clear
    
        return containerView
    }()
    
//    Background of Menu
    private lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .white
        return backgroundView
    }()

    //    MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topConteinerViewLoggined.delegate = self
        buttonStackView.delegate = self
        view.backgroundColor = .clear
        setupLayout()
    }
    
    deinit {
         print("DEINIT MenuViewController")
     }
    
//    MARK: - Layout
    
    private func setupLayout() {
        self.view.addSubview(backgroundView)
        self.view.addSubview(containerView)

        containerView.addSubview(buttonStackView)
        containerView.addSubview(topConteinerViewLoggined)
        containerView.addSubview(topConteinerView)
        
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            backgroundView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            
            containerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            containerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            
            buttonStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -120),
            buttonStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -48),
            buttonStackView.heightAnchor.constraint(equalToConstant: 200),
            
            topConteinerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40),
            topConteinerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            topConteinerView.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -48),
            topConteinerView.heightAnchor.constraint(equalToConstant: 225),
            
            topConteinerViewLoggined.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40),
            topConteinerViewLoggined.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            topConteinerViewLoggined.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -48),
            topConteinerViewLoggined.heightAnchor.constraint(equalToConstant: 270)
        ])
        topConteinerView.isHidden = true
    }
}

extension MenuViewController: MenuTopViewLogginedDelegate {
    func didCreateNewEventTap() {
        delegate?.createNewEvent()
    }
    
    func didToProfileTap() {
        delegate?.toProfilePressed()
    }
    
    func didAvatarTap() {
        delegate?.avatarPressed()
    }
}

extension MenuViewController: MenuButtomStackViewDelegate {
    func didMapTap() {
        delegate?.toMapPressed()
    }
    
    func didFiltersTap() {
        delegate?.toFiltersPressed()
    }
    
    func didSetingsTap() {
        delegate?.toSettingsPressed()
    }
}
