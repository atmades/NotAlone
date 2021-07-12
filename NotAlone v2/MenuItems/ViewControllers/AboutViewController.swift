//
//  AboutViewController.swift
//  NotAlone v2
//
//  Created by Максим on 13.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    //    MARK: - Properties
    var viewModel: AboutViewModel = AboutViewModel()
    
//    UI
    lazy var aboutLabel: UILabel = {
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
    
    lazy var contactUsButton: UIButton = {
        let button = MainButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(String.titleMainButton.contactUs.rawValue, for: .normal)
        button.setupMainColor()
        return button
    }()
    
    //    MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        contactUsButton.addTarget(self, action: #selector(contactUsPressed), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    deinit {
        print("DEINIT AboutViewController")
    }
    
    //    MARK: - Navigation
    fileprivate func setupNavigation() {
        navigationController?.setupChild()
        navigationItem.title = "О нас"
        
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
    
    @objc func contactUsPressed(_ sender: UITapGestureRecognizer) {
        print("contactUs Button Pressed")
    }
    
    
//   MARK: - Private Func
    private func setupLayout() {
        view.addSubview(aboutLabel)
        view.addSubview(contactUsButton)
        
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            aboutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            contactUsButton.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 24),
            contactUsButton.leadingAnchor.constraint(equalTo: aboutLabel.leadingAnchor),
            contactUsButton.trailingAnchor.constraint(equalTo: aboutLabel.trailingAnchor),
            contactUsButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
