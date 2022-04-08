//
//  LocationManager.swift
//  Wethr
//
//  Created by Jorrit Verstappen on 08/04/2022.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
	let manager = CLLocationManager()
	
	@Published var location: CLLocationCoordinate2D?
	@Published var isLoading = false
	
	override init() {
		super.init()
		manager.delegate = self
	}
	
	func requestLocation() {
		isLoading = true
		manager.requestWhenInUseAuthorization()
	}
	
	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		if status == .authorizedWhenInUse {
			manager.requestLocation()
		}
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		location = locations.first?.coordinate
		isLoading = false
	}
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("Location-error", error)
		isLoading = false
	}
}
