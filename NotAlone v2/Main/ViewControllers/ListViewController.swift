//
//  SimpleViewController.swift
//  NotAlone v2
//
//  Created by Максим on 31.12.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

protocol ListToDetail: class {
    func cellPressed(with model: Event)
}

class ListViewController: UIViewController {

    //    MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    private var modelsVC: [Event] = []
    private let cellID = "ListViewCell"
    var viewModel: ListViewModel = ListViewModel()
    
    weak var delegateToDetail: ListToDetail?
    
    //    MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bgBlue
        bindViewModel()
        viewModel.setData()
        setupCellForTableview()
        setupTableView()
    }
    
    override func loadView() {
        super.loadView()
        setLayoutOfTableView()
    }
    
    //    Decelect Cell
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    deinit {
         print("DEINIT ListViewController")
     }
    
    //    MARK: - Fileprivate
    
    fileprivate func bindViewModel() {
        viewModel.modelBind.bind { [unowned self] (models) in
            self.modelsVC = models
            self.tableView.reloadData()
        }
    }
}

//    MARK: - Extension For Setup TableView
extension ListViewController {
    
   fileprivate func setLayoutOfTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 88),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
    }
    
    fileprivate  func setupCellForTableview(){
        tableView.register(UINib.init(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        //  Row Height
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
        //  Separators
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
    }
    
}

//    MARK: - Extension TableViewDataSource

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelsVC.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ListViewCell
        let model = modelsVC[indexPath.row]
        cell.setupCell(model: model)
//        cell.distanseLabel.text = getDistanse(event: model)
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    //     Tap on Cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap Cell En ListfEventsToDetail")
        let selectedEvent = modelsVC[indexPath.row]
        delegateToDetail?.cellPressed(with: selectedEvent)
    }
}


// MARK: - Extension CLLocationManagerDelegate

//extension ListOfEventsViewController: CLLocationManagerDelegate {
//
//  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//    guard status == .authorizedWhenInUse else { return }
//    locationManager.requestLocation()
//  }
//
//  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//    print(error)
//  }
//
//    // Calulating distanse currentLocation -> Event Location
//    func getDistanse(event: Event) -> String {
//        if let latitudeOfMarker = CLLocationDegrees(exactly: event.coordinates.lat),
//            let longitudeOfMarker = CLLocationDegrees(exactly: event.coordinates.lng)  {
//
//            let locationOfMarker = CLLocation(latitude: latitudeOfMarker, longitude: longitudeOfMarker)
//            let currentLocation =  locationManager.location?.coordinate
//
//            if let myLat = currentLocation?.latitude, let myLng = currentLocation?.longitude {
//                let myLocation = CLLocation(latitude: myLat, longitude: myLng)
//                let distanse = locationOfMarker.distance(from: myLocation)
//                //                let distanseString = String(format: "%.2f", distanse)
//                let distanseInt = Int(distanse)
//                return  "\(distanseInt) метров от вас"
//            } else {
//                return "Мы не знаем, где вы"
//            }
//        } else {
//            return "ХЗ, где это"
//        }
//    }
//
//}
