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
		VStack {
			
			Image("CloudWithSun")
				.resizable()
				.scaledToFit()
			
			HStack(alignment: .top, spacing: 0) {
				Text("\(temp.roundDouble())")
					.bold()
				.font(.system(size: 22))
				
				Text("°")
					.font(.system(size: 18))
					.padding(.top, 2)
			} //: HSTACK
			
			Text("\(hour.toHour())")
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
