//
//  HourlyWeatherCard.swift
//  Wethr
//
//  Created by Jorrit Verstappen on 09/04/2022.
//

import SwiftUI

struct HourlyWeatherCard: View {
	// MARK: PROPERTIES
	
	// MARK: BODY
	var body: some View {
		VStack {
			Image("CloudWithSun")
				.resizable()
				.scaledToFit()
			Text("20")
			Text("15:00")
		} //: VSTACK
		.padding(12)
		.overlay(
			RoundedRectangle(cornerRadius: 8)
				.stroke(.white, lineWidth: 1.5)
		)
	}
}

// MARK: PREVIEW
struct HourlyWeatherCard_Previews: PreviewProvider {
	static var previews: some View {
		HourlyWeatherCard()
			.previewLayout(.sizeThatFits)
	}
}
