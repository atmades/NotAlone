//
//  DetailUserEventViewController.swift
//  NotAlone v2
//
//  Created by Максим on 12.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class DetailUserEventViewController: UIViewController {
    
    var event = Event.getData()[0]
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(StatusCell.nib(), forCellReuseIdentifier: StatusCell.identifier)
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
        print("DEINIT DetailUserEventViewController")
    }
    
//    MARK: - Navigation
    fileprivate func setupNavigation() {
        let imageString = String.iconButtonNavBar.back.rawValue
        let image = UIImage(named: imageString)
        navigationController?.navigationBar.backIndicatorImage = image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        
        let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
        
        //  Set Right Buttons
        let iconMore = String.iconButtonNavBar.share.rawValue
        let iconImageMore = UIImage(named: iconMore)
        let moreButton = UIBarButtonItem(image: iconImageMore, style: .plain, target: self, action: #selector(showShare))
        let iconShare = String.iconButtonNavBar.more.rawValue
        let iconImageShare = UIImage(named: iconShare)
        let shareButton = UIBarButtonItem(image: iconImageShare, style: .plain, target: self, action: #selector(showMore))
        navigationItem.rightBarButtonItems = [shareButton, moreButton]
    }
    
    @objc func showMore() {
        print("more")
    }
    
    @objc func showShare() {
        print("share")
    }
}

//  MARK: - Extension DataSource

extension DetailUserEventViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return event.contacts.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: StatusCell.identifier, for: indexPath) as! StatusCell
            cell.setupCell(with: event.status)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopDetailCell.identifier, for: indexPath) as! TopDetailCell
            cell.setupCell(with: event)
            cell.delegateOnMap = self
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.identifier, for: indexPath) as! ContactCell
            let contact = event.contacts[indexPath.row - 2]
            cell.setupCell(with: contact)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
    }
}

//  MARK: - Extension Delegate

extension DetailUserEventViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//  MARK: - Extension Delegate Tap On ShowOnTneMapPressed
extension DetailUserEventViewController: TopDetail {
    func showOnTneMapPressed() {
        let detailMapVC = DetailMapViewController()
        detailMapVC.eventOnMap = EventOnMap(coordinates: event.coordinates, marker: event.marker)
        navigationController?.pushViewController(detailMapVC, animated: true)
    }
}
