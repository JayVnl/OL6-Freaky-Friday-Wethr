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
			
			GeometryReader { gp in
				HStack {
					Text("\(weather.current.weather[0].main)")
						.font(.custom(FontNameManager.Montserrat.bold, size: 36))
						.textCase(.uppercase)
						.rotationEffect(Angle(degrees: 90), anchor: .bottomLeading)
						.offset(x: gp.size.width - (gp.size.width - 108), y: 4)
				}.frame(maxWidth: gp.size.width, alignment: .trailing)
			}
			.ignoresSafeArea()
			
			VStack(alignment: .center, spacing: 0) {
				Text("\(Date().formatted(.dateTime.weekday(.wide))), \(Date().formatted(.dateTime.month(.wide).day()))")
					.font(.custom(FontNameManager.Montserrat.bold, size: 22))
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.leading, 20)
				
				Spacer()
				
				Image("CloudWithSun")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.padding(32)
				
				Spacer()
				
				Text("\(location ?? "")")
					.font(.custom(FontNameManager.Montserrat.semibold, size: 44))
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
							.font(.custom(FontNameManager.Montserrat.semibold, size: 80))
						
						Text("°")
							.font(.custom(FontNameManager.Montserrat.semibold, size: 50))
							.padding(.top, 8)
					} //: HSTACK
					
				} //: HSTACK
				.frame(maxWidth: .infinity)
				.padding(.horizontal, 20)
				
				Text("TODAY")
					.font(.custom(FontNameManager.Montserrat.semibold, size: 26))
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.leading, 20)
					.padding(.top, 24)
					.padding(.bottom, 16)
				
				HStack(spacing: 12) {
					let list = weather.hourly.dropFirst()
					ForEach(list.prefix(4), id:\.dt) { weatherPerHour in
						HourlyWeatherCard(hour: weatherPerHour.dt, temp: weatherPerHour.temp)
					}
				} //: HSTACK
				.padding(.horizontal, 20)
				
			} //: VSTACK
			.frame(maxWidth: .infinity)
			
		} //: ZSTACK
		.background(LinearGradient(gradient: Gradient(colors: [Color("LightBlue"), Color("DarkBlue")]), startPoint: .top, endPoint: .bottom))
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
