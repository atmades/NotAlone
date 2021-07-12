//
//  LegalViewController.swift
//  NotAlone v2
//
//  Created by Максим on 13.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class LegalViewController: UIViewController {
    
    //    MARK: - Properties
    var viewModel: LegalViewModel = LegalViewModel()
    
//    UI
    lazy var legalLabel: UILabel = {
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
    
    //    MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    deinit {
        print("DEINIT LegalViewController")
    }
    
    //    MARK: - Navigation
    fileprivate func setupNavigation() {
        navigationController?.setupChild()
        navigationItem.title = "Юр. информация"
        
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
    
    //   MARK: - Private Func
        private func setupLayout() {
            view.addSubview(legalLabel)
            NSLayoutConstraint.activate([
                legalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
                legalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                legalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ])
        }
}
