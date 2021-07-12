//
//  ChooseCategoryViewController.swift
//  NotAlone v2
//
//  Created by Максим on 05.05.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class ChooseCategoryEventViewController: UIViewController {

    var viewModel: ChooseCategoryViewModel = ChooseCategoryViewModelImpl()
    
    private var selectedCategory: Int? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryCell.nib(), forCellReuseIdentifier: CategoryCell.identifier)

        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
        tableView.backgroundColor = .bgBlue

        return tableView
    }()
    
    //    MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bgBlue
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
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
        print("DEINIT ChooseCategoryViewController")
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
        //  Set Action
        let nextButton = UIBarButtonItem(title: String.titleButtonNavBar.next.rawValue, style: .plain, target: self, action: #selector(goNext))
       
        let styleForDesible = navigationController?.setStyleActionTitleDesible()
        let styleForNormal = navigationController?.setStyleActionTitleNormal()
        nextButton.setTitleTextAttributes(styleForDesible, for: .disabled)
        nextButton.setTitleTextAttributes(styleForNormal,for: .normal)
        navigationItem.rightBarButtonItems = [nextButton]
        
        //  Set style
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)

        //  Set Title and TitleStyles
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.sizeToFit()
        let largeTittleStyle = navigationController?.setStyleForLargeTitle()
        let tittleStyle = navigationController?.setStyleForTitle()
        navigationController?.navigationBar.largeTitleTextAttributes = largeTittleStyle
        navigationController?.navigationBar.titleTextAttributes = tittleStyle
        navigationController?.navigationBar.topItem?.title = String.headersUI.chooseCategory.rawValue
    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    @objc func goNext() {
        let pushesVC = DescriptionEventViewController()
        navigationController?.pushViewController(pushesVC, animated: true)
    }
    
    //    MARK: - Private func
    
    private func updateSelectedIndex(_ index: Int) {
        selectedCategory = index
    }
    
    private func setLayoutOfTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

//    MARK: - Extension TableView DataSource
extension ChooseCategoryEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        let category = viewModel.categories[indexPath.row]
        cell.setupCell(with: category)
        
        let currentIndex = indexPath.row
        let isSelected = currentIndex == selectedCategory

        cell.isSelected(isSelected)
        return cell
    }
}

//    MARK: - Extension TableView Delegate
extension ChooseCategoryEventViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateSelectedIndex(indexPath.row)
        viewModel.selectCatagory(indexPath.row)
    }
}
