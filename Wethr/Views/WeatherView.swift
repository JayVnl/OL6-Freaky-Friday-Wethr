//
//  WeatherView.swift
//  Wethr
//
//  Created by Jorrit Verstappen on 08/04/2022.
//

import SwiftUI

struct WeatherView: View {
	// MARK: PROPERTIES
	var location: String?
	var weather: WeatherResponse
	
	// MARK: BODY
	var body: some View {
		ZStack(alignment: .leading) {
			
			VStack {
				Text("CLOUDY")
					.bold()
					.font(.system(size: 40))
					.frame(maxWidth: .infinity)
					.rotationEffect(Angle(degrees: 90), anchor: .topTrailing)
			} //: VSTACK
			.frame(maxWidth: .infinity, maxHeight: 270, alignment: .top)
			
			
			VStack(alignment: .center, spacing: 0) {
				Text("\(Date().formatted(.dateTime.weekday(.wide))), \(Date().formatted(.dateTime.month(.wide).day()))")
					.bold()
					.font(.system(size: 24))
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.leading, 20)
				
				Spacer()
				
				Image("CloudWithSun")
					.resizable()
					.aspectRatio(contentMode: .fit)
//					.frame(width: 350)
					.padding(32)
				
				Spacer()
				
				Text("\(location ?? "")")
					.bold()
					.font(.system(size: 50))
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.leading, 20)
				
				Rectangle()
					.foregroundColor(.white)
					.frame(maxWidth: .infinity, maxHeight: 3)
					.padding(.leading, 20)
					.padding(.top, 20)
					.padding(.bottom, 16)
				
				HStack {
					
					VStack(alignment: .leading, spacing: 8) {
						IconWithDetails(icon: "wind", value: "\(weather.current.wind_speed.convertToKmPerHour()) km/h")
						IconWithDetails(icon: "safari", value: "\(weather.current.wind_deg.convertToCompassDirection())")
					} //: VSTACK
					
					Spacer()
					
					HStack(alignment: .top, spacing: 0) {
						Text("\(weather.current.temp.roundDouble())")
							.bold()
						.font(.system(size: 80))
						
						Text("°")
							.font(.system(size: 60))
							.padding(.top, 2)
					} //: HSTACK
					
				} //: HSTACK
				.frame(maxWidth: .infinity)
				.padding(.horizontal, 20)
				
				Text("TODAY")
					.bold()
					.font(.system(size: 24))
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.leading, 20)
					.padding(.top, 24)
					.padding(.bottom, 16)
				
				HStack(spacing: 12) {
					HourlyWeatherCard()
					HourlyWeatherCard()
					HourlyWeatherCard()
					HourlyWeatherCard()
				} //: HSTACK
				.padding(.horizontal, 20)
				
			} //: VSTACK
			.frame(maxWidth: .infinity)
			
		} //: ZSTACK
		.background(Color(hue: 0.587, saturation: 0.916, brightness: 0.779))
		.preferredColorScheme(.dark)
	}
}

// MARK: PREVIEW
struct WeatherView_Previews: PreviewProvider {
	static var previews: some View {
		WeatherView(location: "Eindhoven", weather: weatherMockupData)
			.previewDevice("iPhone 11")
	}
}
