//
//  WeatherImage.swift
//  Wethr
//
//  Created by Jorrit Verstappen on 10/04/2022.
//

import SwiftUI

struct WeatherImage: View {
	// MARK: PROPERTIES
	var iconId: String
	
	// MARK: BODY
	var body: some View {
		Image(defineIcon(iconId: iconId))
			.resizable()
			.aspectRatio(contentMode: .fit)
			.padding(32)
	}
}

func defineIcon(iconId: String) -> String {
	switch iconId {
	case "04d":
		return "CloudWithSun"
	default:
		return "CloudWithSun"
	}
}

// MARK: PREVIEW
struct WeatherImage_Previews: PreviewProvider {
	static var previews: some View {
		WeatherImage(iconId: "04d")
	}
}
