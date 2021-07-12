//
//  DateViewController.swift
//  NotAlone v2
//
//  Created by Максим on 04.06.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class DateEventViewController: UIViewController {
    
    //    MARK: - Properties
    private var viewModel: DateEventViewModel = DateEventViewModelImpl()
    
    
    //    MARK: - Elements
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DateEventCell.nib(),forCellReuseIdentifier: DateEventCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = UIColor(named: String.colors.bgBlue.rawValue)
        return tableView
    }()

    
    //    MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: String.colors.bgBlue.rawValue)
        view.addSubview(tableView)
        tableView.dataSource = self
        setupTapGestures()
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
        print("DEINIT DateViewController")
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
        navigationItem.title = String.headersUI.dateAndTime.rawValue
        
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

//    MARK: - Extension UITableViewDataSource

extension DateEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DateEventCell.identifier, for: indexPath)
        return cell
    }
}

extension DateEventViewController: DateEventCellDelegate {
    func didDateChanged(date: String) {
        print("didDateChanged")
    }
    
    func didStartTimeChanged(time: String) {
        print("didStartTimeChanged")
    }
    
    func didEndTimeChanged(time: String) {
        print("didEndTimeChanged")
    }
}
