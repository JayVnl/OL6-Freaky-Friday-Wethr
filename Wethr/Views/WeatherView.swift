//
//  HomeView.swift
//  Wethr
//
//  Created by Jorrit Verstappen on 08/04/2022.
//

import SwiftUI

struct WeatherView: View {
	// MARK: PROPERTIES
	@EnvironmentObject var locationManager: LocationManager
	
	// MARK: BODY
	var body: some View {
		VStack {
			
			VStack {
				
				if let location = locationManager.location {
					Text("Your coordinates are: \(location.latitude), \(location.longitude)")
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
struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		WeatherView()
			.environmentObject(LocationManager())
			.previewDevice("iPhone 11")
	}
}
