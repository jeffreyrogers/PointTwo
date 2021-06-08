//
//  LocationViewModel.swift
//  PointTwo
//
//  Created by Jeffrey Rogers on 6/7/21.
//

import Foundation
import Combine
import CoreLocation

class LocationViewModel: NSObject, ObservableObject {
    @Published var userLocation: CLLocation = CLLocation(latitude: 0, longitude: 0)

    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLocation = location
    }
}
