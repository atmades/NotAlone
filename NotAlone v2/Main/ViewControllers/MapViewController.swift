//
//  MapViewController.swift
//  NotAlone v2
//
//  Created by Максим on 29.12.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    var eventes: [Event] = Event.getData()
    var markers = [GMSMarker]()
    let locationManager = CLLocationManager()
    
    var mapView: GMSMapView = {
        let mapView = GMSMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    //    MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        locationManager.delegate = self
        mapView.delegate = self
        checkingRequestLocation()
        addMarkers()
    }
    
    deinit {
         print("DEINIT MapViewController")
     }
    
    //    MARK: - Private Func
    
    private func checkingRequestLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
            mapView.isMyLocationEnabled = true
            mapView.settings.myLocationButton = true
            
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    private func setupMapView() {
        self.view.addSubview(mapView)
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mapView.settings.rotateGestures = false
        mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 128, right: 15)
    }
    
    //  Add markers
    private func addMarkers() {
        markers.removeAll()
        for (index, event) in eventes.enumerated() {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: event.coordinates.lat,
                                                     longitude: event.coordinates.lng)
            marker.infoWindowAnchor = CGPoint(x: 0, y: -0.1)
            marker.icon = UIImage(named: event.marker)
            marker.map = self.mapView
            marker.zIndex = Int32(index)
            marker.userData = event
            markers.append(marker)
        }
    }
}

// MARK: - Extension CLLocationManagerDelegate

extension MapViewController: CLLocationManagerDelegate {

  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    guard status == .authorizedWhenInUse else { return }
    locationManager.requestLocation()
    mapView.isMyLocationEnabled = true
    mapView.settings.myLocationButton = true
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else { return }
    mapView.camera = GMSCameraPosition(target: (location.coordinate), zoom: 15, bearing: 0, viewingAngle: 0)
  }
    
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error)
  }
    
    // Calulating distanse currentLocation -> Event Location
    func getDistanse(event: Event) -> String {
        if let latitudeOfMarker = CLLocationDegrees(exactly: event.coordinates.lat),
            let longitudeOfMarker = CLLocationDegrees(exactly: event.coordinates.lng)  {
            
            let locationOfMarker = CLLocation(latitude: latitudeOfMarker, longitude: longitudeOfMarker)
            let currentLocation =  locationManager.location?.coordinate
            
            if let myLat = currentLocation?.latitude, let myLng = currentLocation?.longitude {
                let myLocation = CLLocation(latitude: myLat, longitude: myLng)
                let distanse = locationOfMarker.distance(from: myLocation)
                //                let distanseString = String(format: "%.2f", distanse)
                let distanseInt = Int(distanse)
                return  "\(distanseInt) метров от вас"
            } else {
                return "Мы не знаем, где вы"
            }
        } else {
            return "ХЗ, где это"
        }
    }
}

// MARK: - Extension GMSMapViewDelegate
extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let event = marker.userData as? Event {
            marker.icon = UIImage(named: event.markerSelected)
        }
        return false
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        if let event = marker.userData as? Event {
            marker.tracksInfoWindowChanges = true
            let infoWindow = CustomInfoWindow()
            //   infoWindow.tag = 5555
            infoWindow.frame = CGRect(x: 0, y: 0, width: 306, height: 148)
            infoWindow.avatarImageView.image = UIImage(named: event.avatar)
            infoWindow.nameLabel.text = event.name
            infoWindow.detailLabel.text = event.detail
            
            return infoWindow
        }
        return nil
    }
    
    //  After closing the info window change marker color is default blue
    func mapView(_ mapView: GMSMapView, didCloseInfoWindowOf marker: GMSMarker) {
        if let event = marker.userData as? Event {
            marker.icon = UIImage(named: event.marker)
        }
    }
    
    func changingCameraForInfoWindow(lat: CLLocationDegrees, long: CLLocationDegrees) -> CLLocationCoordinate2D {
        let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat - 9.0),
                                                longitude: CLLocationDegrees(long + 1.0))
        return coordinate
    }
}
