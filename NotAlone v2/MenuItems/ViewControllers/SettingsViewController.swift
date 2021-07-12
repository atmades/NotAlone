//
//  SettingsViewController.swift
//  NotAlone v2
//
//  Created by Максим on 13.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var viewModel: SettingsViewModel = SettingsViewModel()
    var settingsList: [Settings] = []
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SettingsCell.nib(), forCellReuseIdentifier: SettingsCell.identifier)
        tableView.register(ButtonViewCell.nib(), forCellReuseIdentifier: ButtonViewCell.identifier)

        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = .bgBlue
        return tableView
    }()
    
    //    MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bgBlue
        view.addSubview(tableView)
        settingsList = viewModel.getData()
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayoutOfTableView()
//        tableView.frame = view.bounds
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    deinit {
        print("DEINIT SettingsViewController")
    }
    
    //    MARK: - Navigation
    
    fileprivate func setupNavigation() {
        //  Set Left Icon
        let icon = String.iconButtonNavBar.close.rawValue
        let iconImage = UIImage(named: icon)?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: iconImage,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(dismissSelf))
        
        //  Set style
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        
        //  Set Title and TitleStyles
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.sizeToFit()
        
        let largeTittleStyle = [
            NSAttributedString.Key.foregroundColor: UIColor.textHeaderDark,
            NSAttributedString.Key.font: UIFont(name: "RobotoSlab-Regular", size: 24)!
        ]
        let tittleStyle = [
            NSAttributedString.Key.foregroundColor: UIColor.textHeaderDark,
            NSAttributedString.Key.font: UIFont(name: "RobotoSlab-Regular", size: 17)!
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = largeTittleStyle
        navigationController?.navigationBar.titleTextAttributes = tittleStyle
        navigationController?.navigationBar.topItem?.title = "Настройки"
    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    //    MARK: - Fileprivate func
    fileprivate func setLayoutOfTableView() {
        //        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - EXTENSION  UITableView DataSource

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingsList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < settingsList.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as! SettingsCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            let item = settingsList[indexPath.row]
            cell.setupCell(with: item)
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonViewCell.identifier, for: indexPath) as! ButtonViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            let title = String.titleMainButton.exit.rawValue
            cell.setupTitle(with: title)
            cell.delegateButtonCell = self
            return cell
        }
    }
}

// MARK: - EXTENSION UITableView Delegate

extension SettingsViewController: UITableViewDelegate {
    //     Tap on Cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let pushesVC = PushesViewController()
            navigationController?.pushViewController(pushesVC, animated: true)
        } else if indexPath.row == 1 {
            let donateVC = DonateViewController()
            navigationController?.pushViewController(donateVC, animated: true)
        } else if indexPath.row == 2 {
            let aboutVC = AboutViewController()
            navigationController?.pushViewController(aboutVC, animated: true)
        } else if indexPath.row == 3 {
            let legalVC = LegalViewController()
            navigationController?.pushViewController(legalVC, animated: true)
        }
    }
    
}

// MARK: - EXTENSION ButtonCell
extension SettingsViewController: ButtonCell {
    func buttonCellpressed(sender: ButtonViewCell) {
        print("pressed Exit from Settings")
    }
    
//    func buttonCellpressed() {
//        print("pressed Exit from Settings")
//    }
}
