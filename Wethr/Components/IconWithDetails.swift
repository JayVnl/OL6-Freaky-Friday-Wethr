//
//  IconWithDetails.swift
//  Wethr
//
//  Created by Jorrit Verstappen on 09/04/2022.
//

import SwiftUI

struct IconWithDetails: View {
	// MARK: PROPERTIES
	var icon: String
	var value: String
	
	// MARK: BODY
	var body: some View {
		HStack(spacing: 5) {
			Text("\(Image(systemName: icon))")
				.font(.system(size: 24))
				.frame(width: 32)
			Text("\(value)")
				.font(.custom(FontNameManager.Montserrat.medium, size: 28))
		}
	}
}

// MARK: PREVIEW
struct IconWithDetails_Previews: PreviewProvider {
	static var previews: some View {
		IconWithDetails(icon: "wind", value: "13 km/h")
			.previewLayout(.sizeThatFits)
	}
}
