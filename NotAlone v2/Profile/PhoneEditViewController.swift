//
//  PhoneEditViewController.swift
//  NotAlone v2
//
//  Created by Максим on 11.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class PhoneEditViewController: UIViewController {
    
    //    MARK: - Properties
    private lazy var pizitionY: CGFloat = -(view.frame.size.height/2)
    
    //    MARK: - UI Elements
    private lazy var textField: UITextField = {
        let textField = TextFieldCustom()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Укажите телефон"
        textField.setup()
        return textField
    }()

    private lazy var okButton: UIButton = {
        let button = MainButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let title = String.titleMainButton.changeName.rawValue
        button.setTitle(title, for: .normal)
        button.setupMainColor()
        return button
    }()
    
    private lazy var header: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .textHeaderPuprle
        label.alpha = 0.5
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.text = "Ваша телефон"
        return label
    }()
    
    //    MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textField.delegate = self
        setupLoyaut()

        setupTapGestures()
        okButton.addTarget(self, action: #selector(okButtonPressed), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    deinit {
        print("DEINIT PhoneEditViewController")
    }
    
    //    MARK: - Fileprivate Functions
    
    fileprivate func setupNavigation() {
        let icon = String.iconButtonNavBar.back.rawValue
        navigationController?.setupIconBack(viewController: self, icon: icon)
        
        //  Set style
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    //    MARK: - Gestures
    @objc fileprivate func okButtonPressed(_ sender: UITapGestureRecognizer) {
        print("tap okButtonPressed")
        view.endEditing(true)
    }
    
    //  Hide Keyboard with Tap on View
    fileprivate func setupTapGestures() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss))
        view.addGestureRecognizer(gesture)
    }
    
    @objc fileprivate func handleTapDismiss() {
        self.view.endEditing(true)  // dismiss keyboard
    }
    
    
//    MARK: - UI Layout
    fileprivate func setupLoyaut() {
        view.addSubview(okButton)
        view.addSubview(textField)
        view.addSubview(header)

        NSLayoutConstraint.activate([
            okButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: pizitionY),
            okButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            okButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            okButton.heightAnchor.constraint(equalToConstant: 48),

            textField.bottomAnchor.constraint(equalTo: okButton.topAnchor, constant: -48),
            textField.leadingAnchor.constraint(equalTo: okButton.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: okButton.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 56),
            
            header.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: 10),
            header.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 0),
            header.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 0)
        ])
    }
}

// MARK: - extension UITextFieldDelegate
extension PhoneEditViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
