//
//  HourlyWeatherCard.swift
//  Wethr
//
//  Created by Jorrit Verstappen on 09/04/2022.
//

import SwiftUI

struct HourlyWeatherCard: View {
	// MARK: PROPERTIES
	var hour: Int
	var temp: Double
	
	// MARK: BODY
	var body: some View {
		VStack(spacing: 0) {
			
			Image("CloudWithSun")
				.resizable()
				.scaledToFit()
				.padding(.bottom, 2)
			
			HStack(alignment: .top, spacing: 0) {
				Text("\(temp.roundDouble())")
					.font(.custom(FontNameManager.Montserrat.semibold, size: 30))
					.padding(.leading, 2)
				
				Text("°")
					.font(.custom(FontNameManager.Montserrat.semibold, size: 20))
					.padding(.top, 2)
			} //: HSTACK
			.padding(.vertical, 2)
			
			Text("\(hour.toHour())")
				.font(.custom(FontNameManager.Montserrat.medium, size: 18))
				.opacity(0.7)
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
		HourlyWeatherCard(hour: 1649433600, temp: 20.3)
			.previewLayout(.sizeThatFits)
	}
}
