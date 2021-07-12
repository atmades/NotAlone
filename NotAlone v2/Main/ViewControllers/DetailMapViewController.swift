//
//  DetailMapViewController.swift
//  NotAlone v2
//
//  Created by Максим on 02.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit
import GoogleMaps

struct EventOnMap {
    var coordinates: (lat: Double, lng: Double)
    var marker: String
}

class DetailMapViewController: UIViewController {
    
    var eventOnMap: EventOnMap?
    var coordinates: (lat: Double, lng: Double) = (lat: 0, lng: 0)
    var marker = GMSMarker()
    
    var mapView: GMSMapView = {
        let mapView = GMSMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    //    MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupMarker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    deinit {
        print("DEINIT DetailMapViewController")
    }
    
    //    MARK: - FilePrivate Func
    fileprivate func setupNavigation() {
        let imageString = String.iconButtonNavBar.back.rawValue
        let image = UIImage(named: imageString)
        navigationController?.navigationBar.backIndicatorImage = image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    fileprivate func setupMapView() {
        self.view.addSubview(mapView)
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true

        mapView.settings.rotateGestures = false
        mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 128, right: 15)
    }
    
    //  Add marker
   fileprivate func setupMarker() {
        guard let eventOnMap = eventOnMap else { return }
        let lat = eventOnMap.coordinates.lat
        let lng = eventOnMap.coordinates.lng
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        marker.icon = UIImage(named: eventOnMap.marker)
        marker.map = self.mapView
        
        let location = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: 14)
        mapView.camera = location
    }
}
