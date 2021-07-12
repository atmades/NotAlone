//
//  ProfileViewController.swift
//  NotAlone v2
//
//  Created by Максим on 08.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//


import UIKit

class ProfileViewController: UIViewController {

    var viewModel: ProfileViewModel = ProfileViewModel()
    private lazy var user = viewModel.user
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileAvatarCell.nib(), forCellReuseIdentifier: ProfileAvatarCell.identifier)
        tableView.register(ProfileUserInfoCell.nib(), forCellReuseIdentifier: ProfileUserInfoCell.identifier)
        tableView.register(ButtonViewCell.nib(), forCellReuseIdentifier: ButtonViewCell.identifier)
        tableView.register(HeaderListViewCell.nib(), forCellReuseIdentifier: HeaderListViewCell.identifier)
        
        tableView.register(ListViewCell.nib(), forCellReuseIdentifier: ListViewCell.identifier)
        tableView.register(EmptyListEventsCell.nib(), forCellReuseIdentifier: EmptyListEventsCell.identifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
        return tableView
    }()
    
    //    MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    deinit {
        print("DEINIT ProfileViewController")
    }
    
    //    MARK: - Navigation
    fileprivate func setupNavigation() {
        let icon = String.iconButtonNavBar.close.rawValue
        let iconImage = UIImage(named: icon)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: iconImage, style: .plain, target: self, action: #selector(dismissSelf))
        
        //  Set style
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = UIColor.bgBlue
        navigationController?.navigationBar.tintColor = UIColor.textHeaderPuprle
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)

        let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - EXTENSION  UITableView DataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userEventsCount = user.events?.count ?? 1
        return 6 + userEventsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileAvatarCell.identifier, for: indexPath) as! ProfileAvatarCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.setupCell(with: user)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileUserInfoCell.identifier, for: indexPath) as! ProfileUserInfoCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.setupCell(header: "Ваше имя", content: user.name, placeholder: "Укажите ваше имя")
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileUserInfoCell.identifier, for: indexPath) as! ProfileUserInfoCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.setupCell(header: "Ваш телефон", content: user.phone, placeholder: "Укажите ваш телефон")
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileUserInfoCell.identifier, for: indexPath) as! ProfileUserInfoCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.setupCell(header: "Ваш e-mail", content: user.email, placeholder: "Укажите ваш E-mail")
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonViewCell.identifier, for: indexPath) as! ButtonViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.delegateButtonCell = self
            let title = String.titleMainButton.exit.rawValue
            cell.setupTitle(with: title)
            cell.setupMainStyle()
            return cell
            
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderListViewCell.identifier, for: indexPath) as! HeaderListViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        
        default:
            if let events = user.events {
                let cell = tableView.dequeueReusableCell(withIdentifier: ListViewCell.identifier, for: indexPath) as! ListViewCell
                let event = events[indexPath.row - 6]
                cell.setupCellforUser(model: event)
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
              
                return cell
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: EmptyListEventsCell.identifier, for: indexPath) as! EmptyListEventsCell
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                
                return cell
            }
        }
    }
}

// MARK: - EXTENSION  UITableView Delegate

extension ProfileViewController: UITableViewDelegate {
    //     Tap on Cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let toEditVC = NameEditViewController()
            navigationController?.pushViewController(toEditVC, animated: true)
        } else if indexPath.row == 2 {
            let toEditVC = PhoneEditViewController()
            navigationController?.pushViewController(toEditVC, animated: true)
        } else if indexPath.row == 3 {
            let toEditVC = EmailEditViewController()
            navigationController?.pushViewController(toEditVC, animated: true)
        } else if indexPath.row>5, let events = user.events {
            let toDetailVC = DetailUserEventViewController()
            toDetailVC.event = events[indexPath.row-6]
            navigationController?.pushViewController(toDetailVC, animated: true)
        }
    }
}

extension ProfileViewController: ButtonCell {
    func buttonCellpressed(sender: ButtonViewCell) {
        print("pressed Exit from Profile")
    }
}
