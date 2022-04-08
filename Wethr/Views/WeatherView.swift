//
//  WeatherView.swift
//  Wethr
//
//  Created by Jorrit Verstappen on 08/04/2022.
//

import SwiftUI

struct WeatherView: View {
	// MARK: PROPERTIES
	var weather: WeatherResponse
	
	// MARK: BODY
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// MARK: PREVIEW
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: weatherMockupData)
				.previewDevice("iPhone 11")
    }
}
