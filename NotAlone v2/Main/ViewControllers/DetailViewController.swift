//
//  DetailViewController.swift
//  NotAlone v2
//
//  Created by Максим on 01.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var event = Event.getData()[0]
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TopDetailCell.nib(), forCellReuseIdentifier: TopDetailCell.identifier)
        tableView.register(ContactCell.nib(), forCellReuseIdentifier: ContactCell.identifier)
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
        print("DEINIT DetailViewController")
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
        
        let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
    }
    
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}

//  MARK: - Extension DataSource

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return event.contacts.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TopDetailCell.identifier, for: indexPath) as! TopDetailCell
            cell.setupCell(with: event)
            cell.delegateOnMap = self
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.identifier, for: indexPath) as! ContactCell
        let contact = event.contacts[indexPath.row - 1]
        cell.setupCell(with: contact)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
}

//  MARK: - Extension Delegate

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//  MARK: - Extension Delegate Tap On ShowOnTneMapPressed
extension DetailViewController: TopDetail {
    func showOnTneMapPressed() {
        let detailMapVC = DetailMapViewController()
        detailMapVC.eventOnMap = EventOnMap(coordinates: event.coordinates, marker: event.marker)
        navigationController?.pushViewController(detailMapVC, animated: true)
    }
}
