//
//  PushesViewController.swift
//  NotAlone v2
//
//  Created by Максим on 13.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class PushesViewController: UIViewController {
    
    var viewModel: PushesViewModel = PushesViewModel()
    
    private var tableView: UITableView = {
        let tableView = UITableView()    
        tableView.register(PickerCell.nib(), forCellReuseIdentifier: PickerCell.identifier)
        tableView.register(SwitcherCell.nib(), forCellReuseIdentifier: SwitcherCell.identifier)
        
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
        tableView.dataSource = self
//        tableView.delegate = self
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
        print("DEINIT PushesViewController")
    }
    
    //    MARK: - Navigation
    fileprivate func setupNavigation() {
        
        navigationController?.setupChild()
        navigationItem.title = "Уведомления"
        
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

extension PushesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SwitcherCell.identifier, for: indexPath) as! SwitcherCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            let title = viewModel.pushesTitle
            cell.setupCell(title: title)
            cell.delegate = self
            return cell
            
        } else if indexPath.row == 1  {
            let cell = tableView.dequeueReusableCell(withIdentifier: PickerCell.identifier, for: indexPath) as! PickerCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            let title = viewModel.timeFrom
            cell.setupCell(title: title)
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PickerCell.identifier, for: indexPath) as! PickerCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            let title = viewModel.timeTo
            cell.setupCell(title: title)
            cell.delegate = self
            return cell
            
        }
        

    }
}

extension PushesViewController: PickerCellDelegate {
    func pickerButtonPressed(sender: PickerCell) {
        if let selectedIndexPath = tableView.indexPath(for: sender) {
            if selectedIndexPath.row == 1 {
                print("picker C")
            } else {
                print("picker До")
            }  
        }
    }
}



extension PushesViewController: SwitcherCelllDelegate {
    func pushesSwitcherPressed(sender: SwitcherCell) {
        if sender.switcher.isOn {
            print("switcher On")
        } else {
            print("switcher Off")
        }
    }
}
