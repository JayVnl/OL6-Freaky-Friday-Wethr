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
		ZStack(alignment: .leading) {
			
			VStack {
				Text("CLOUDY")
					.bold()
					.font(.system(size: 40))
					.frame(maxWidth: .infinity)
					.rotationEffect(Angle(degrees: 90), anchor: .topTrailing)
			} //: VSTACK
			.frame(maxWidth: .infinity, maxHeight: 270, alignment: .top)
			
			
			VStack(alignment: .center) {
				Text("\(Date().formatted(.dateTime.weekday(.wide))), \(Date().formatted(.dateTime.month(.wide).day()))")
					.bold()
					.font(.system(size: 24))
					.frame(maxWidth: .infinity, alignment: .leading)
				
				Spacer()
				
				Image("CloudWithSun")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 350)
				
				Spacer()
				
				Text("Eindhoven")
					.bold()
					.font(.system(size: 50))
					.frame(maxWidth: .infinity, alignment: .leading)
				
				Spacer()
					.frame(height: 20)
				
				Rectangle()
					.foregroundColor(.white)
					.frame(maxWidth: .infinity, maxHeight: 5)
				
				Spacer()
					.frame(height: 20)
				
				HStack {
					VStack {
						
					}
					Spacer()
					Text("\(weather.current.temp.roundDouble())")
				} //: HSTACK
				.frame(maxWidth: .infinity)
				
			} //: VSTACK
			.frame(maxWidth: .infinity)
			
		} //: ZSTACK
		.padding(.horizontal, 20)
		.background(Color(hue: 0.587, saturation: 0.916, brightness: 0.779))
		.preferredColorScheme(.dark)
	}
}

// MARK: PREVIEW
struct WeatherView_Previews: PreviewProvider {
	static var previews: some View {
		WeatherView(weather: weatherMockupData)
			.previewDevice("iPhone 11")
	}
}
