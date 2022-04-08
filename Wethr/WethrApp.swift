//
//  WethrApp.swift
//  Wethr
//
//  Created by Jorrit Verstappen on 08/04/2022.
//

import SwiftUI

@main
struct WethrApp: App {
	// MARK: PROPERTIES
	@StateObject var locationManager = LocationManager()
	
	// MARK: BODY
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(locationManager)
				.onAppear {
					locationManager.requestLocation()
				}
		}
	}
}
