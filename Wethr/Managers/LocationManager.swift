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
	
	@Published var coords: CLLocationCoordinate2D?
	@Published var location: CLPlacemark?
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
		coords = locations.first?.coordinate
		
		if let coords = coords {
			let locationObj = CLLocation(latitude: coords.latitude, longitude: coords.longitude)
			
			let geocoder = CLGeocoder()
			geocoder.reverseGeocodeLocation(locationObj) { placemarks, error in
				guard error == nil else {
					print("=====> Error \(error!.localizedDescription)")
					return
				}
				guard let placemark = placemarks?.first else {
					print("=====> Error placemark is nil")
					return
				}
				self.location = placemark
			}
		}
		isLoading = false
	}
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("Location-error", error)
		isLoading = false
	}
}
