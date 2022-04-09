//
//  HomeView.swift
//  Wethr
//
//  Created by Jorrit Verstappen on 08/04/2022.
//

import SwiftUI

struct ContentView: View {
	// MARK: PROPERTIES
	@EnvironmentObject var locationManager: LocationManager
	var weatherManager = WeatherManager()
	@State var weather: WeatherResponse?
	
	// MARK: BODY
	var body: some View {
		VStack {
			
			VStack {
				
				if let coords = locationManager.coords {
					if let weather = weather {
						WeatherView(location: locationManager.location?.locality, weather: weather)
					} else {
						ProgressView()
							.task {
								do {
									weather = try await weatherManager.getWeatherData(lat: coords.latitude, lng: coords.longitude)
								} catch {
									print("Error getting weather: \(error)")
								}
							}
					}
				} else if locationManager.isLoading {
					ProgressView()
				}
				
			} //: VSTACK
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			
		} //: VSTACK
		.background(Color(hue: 0.654, saturation: 0.958, brightness: 0.612))
		.preferredColorScheme(.dark)
	}
}

// MARK: PREVIEW
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.environmentObject(LocationManager())
			.previewDevice("iPhone 11")
	}
}
