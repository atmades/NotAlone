//
//  FiltersViewController.swift
//  NotAlone v2
//
//  Created by Максим on 13.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {
    
    var viewModel: FiltersViewModel = FiltersViewModelImpl()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HeaderFiltersCell.nib(), forCellReuseIdentifier: HeaderFiltersCell.identifier)
        tableView.register(FilterViewCell.nib(), forCellReuseIdentifier: FilterViewCell.identifier)

        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
        tableView.backgroundColor = .bgBlue

        return tableView
    }()
    
    //    MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .bgBlue
        tableView.dataSource = self
        
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
        print("DEINIT FiltersViewController")
    }
    
    //    MARK: - Navigation
    fileprivate func setupNavigation() {
        let icon = String.iconButtonNavBar.close.rawValue
        let iconImage = UIImage(named: icon)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: iconImage, style: .plain, target: self, action: #selector(dismissSelf))
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = UIColor.bgBlue
        navigationController?.navigationBar.tintColor = UIColor.textHeaderPuprle
        navigationController!.navigationBar.setBackgroundImage(nil, for: .default)
    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}

//    MARK: - Extension TableView DataSource
extension FiltersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderFiltersCell.identifier, for: indexPath) as! HeaderFiltersCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FilterViewCell.identifier, for: indexPath) as! FilterViewCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none

            let category = viewModel.categories[indexPath.row-1]
            let isSelectedCell = viewModel.checkIsSelected(category: category)
            cell.setupCell(with: category, isSelectedCell: isSelectedCell)
            cell.delegate = self
            return cell
        }
    }
}

extension FiltersViewController: FilterDelegate {
    func selectCategory(sender: FilterViewCell) {
        if let selectedIndexPath = tableView.indexPath(for: sender) {
            let index = selectedIndexPath.row-1
            let category = viewModel.categories[index]
            viewModel.changeSelected(category: category)
        }
    }
}
