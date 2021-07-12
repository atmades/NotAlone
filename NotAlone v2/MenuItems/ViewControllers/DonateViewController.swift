//
//  DonateViewController.swift
//  NotAlone v2
//
//  Created by Максим on 13.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class DonateViewController: UIViewController {
    
    //    MARK: - Properties
    var viewModel: LegalViewModel = LegalViewModel()
    
//    UI
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.text = viewModel.text
        label.setTextWithLineSpacing(label: label, text: label.text!, lineSpacing: 8)
        label.textAlignment = .left
        return label
    }()
    
    lazy var donateButton: UIButton = {
        let button = MainButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(String.titleMainButton.donate.rawValue, for: .normal)
        button.setupMainColor()
        return button
    }()
    
    lazy var tasksButton: UIButton = {
        let button = ButtonStroke(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(String.titleMainButton.tasks.rawValue, for: .normal)
        
        return button
        
    }()
    

    //    MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        donateButton.addTarget(self, action: #selector(donatePressed), for: .touchUpInside)
        tasksButton.addTarget(self, action: #selector(tasksPressed), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    deinit {
        print("DEINIT DonateViewController")
    }
    
    //    MARK: - Navigation
    fileprivate func setupNavigation() {
        navigationController?.setupChild()
        navigationItem.title = "Помочь проекту"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: String.iconButtonNavBar.back.rawValue)?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(back)
        )
    }
    //    MARK: - @objc Func
    @objc func back(){
        print("back")
        navigationController?.popViewController(animated: true)
    }
    
    @objc func donatePressed(_ sender: UITapGestureRecognizer) {
        print("donate Button Pressed")
    }
    
    @objc func tasksPressed(_ sender: UITapGestureRecognizer) {
        print("tasks Button Pressed")
    }
    
    //   MARK: - Private Func
        private func setupLayout() {
            view.addSubview(descriptionLabel)
            view.addSubview(donateButton)
            view.addSubview(tasksButton)
            NSLayoutConstraint.activate([
                descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
                descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                
                donateButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
                donateButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
                donateButton.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
                donateButton.heightAnchor.constraint(equalToConstant: 48),
                
                tasksButton.topAnchor.constraint(equalTo: donateButton.bottomAnchor, constant: 24),
                tasksButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
                tasksButton.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
                tasksButton.heightAnchor.constraint(equalToConstant: 48),
            ])
        }
    
}
