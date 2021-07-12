//
//  ContactsViewController.swift
//  NotAlone v2
//
//  Created by Максим on 17.05.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class ContactsEventViewController: UIViewController {
    
    //    MARK: - Properties
    private var viewModel: ContactsEventViewModel = ContactsEventViewModelImpl()
    private var contacts: [Contact] = []
    
    //    MARK: - Elements
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(EventContactsCell.nib(),forCellReuseIdentifier: EventContactsCell.identifier)
        tableView.register(ButtonViewCell.nib(), forCellReuseIdentifier: ButtonViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
        //        tableView.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
        tableView.backgroundColor = .bgBlue
        
        return tableView
    }()
    
    //    MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: String.colors.bgBlue.rawValue)
        setupTapGestures()
        bindViewModel()
        view.addSubview(tableView)
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayoutOfTableView()
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    deinit {
        print("DEINIT ContactsViewController")
    }
    
    fileprivate func bindViewModel() {
        viewModel.contactsBind.bindAndFire { [weak self] contacts in
            guard let self = self else { return }
            let isCountUpdate = self.contacts.count != contacts.count
            self.contacts = contacts
            
            if isCountUpdate {
                self.tableView.reloadData()
            }
        }
    }
    
    //    MARK: - Navigation
    
    fileprivate func setupNavigation() {
        //  Set Action
        let nextButton = UIBarButtonItem(title: String.titleButtonNavBar.next.rawValue, style: .plain, target: self, action: #selector(goNext))
        let styleForDesible = navigationController?.setStyleActionTitleDesible()
        let styleForNormal = navigationController?.setStyleActionTitleNormal()
        nextButton.setTitleTextAttributes(styleForDesible, for: .disabled)
        nextButton.setTitleTextAttributes(styleForNormal,for: .normal)
        navigationItem.rightBarButtonItems = [nextButton]
        
        navigationController?.setupChild()
        navigationItem.title = String.headersUI.contacts.rawValue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: String.iconButtonNavBar.back.rawValue)?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(back)
        )
    }
    
    //    MARK: - Func objc
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    
    @objc func back(){
        print("back")
        navigationController?.popViewController(animated: true)
    }
    
    @objc func goNext() {
        print("Go Next")
        let dateVC = DateEventViewController()
        navigationController?.pushViewController(dateVC, animated: true)
    }
    
    //    MARK: - Private func
    
    private func setLayoutOfTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    //  Hide Keyboard with Tap on View
    fileprivate func setupTapGestures() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss))
        view.addGestureRecognizer(gesture)
    }
    
    @objc fileprivate func handleTapDismiss() {
        self.view.endEditing(true)  // dismiss keyboard
    }
}

//    MARK: - Extension TableView DataSource

extension ContactsEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let lastIndex = contacts.count
        
        switch indexPath.row {
        case lastIndex:
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonViewCell.identifier, for: indexPath) as! ButtonViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            let title = String.titleMainButton.addContact.rawValue
            cell.setupTitle(with: title)
            cell.setupMainStyle()
            cell.delegateButtonCell = self
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: EventContactsCell.identifier, for: indexPath) as! EventContactsCell
            cell.setup(contact: contacts[indexPath.row], index: indexPath.row, type: indexPath.row == 0 ? .main : .contact)
            cell.delegate = self
            return cell
        }
    }
}

// MARK: - Add Contact Delegate
extension ContactsEventViewController: ButtonCell {
    func buttonCellpressed(sender: ButtonViewCell) {
        viewModel.didAddContactTap()
    }
}

// MARK: - EventContacts Delegate
extension ContactsEventViewController: EventContactsCellDelegate {
    func didPhoneChanged(phone: String, index: Int) {
        viewModel.didContactPhoneChanged(phone: phone, index: index)
    }
    
    func didEmailChanged(email: String, index: Int) {
        viewModel.didContactEmailChanged(email: email, index: index)
    }
    
    func didNameChanged(name: String, index: Int) {
        viewModel.didContactNameChanged(name: name, index: index)
    }
    
    func didDeleteTap(index: Int) {
        viewModel.didRemoveContactTap(index: index)
    }
    
    func didUseMyContactsTap() {
        viewModel.didUseMyConstactsTap()
    }
}

