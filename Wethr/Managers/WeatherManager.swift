//
//  WeatherManager.swift
//  Wethr
//
//  Created by Jorrit Verstappen on 08/04/2022.
//

import Foundation
import CoreLocation

class WeatherManager {
	func getWeatherData(lat: CLLocationDegrees, lng: CLLocationDegrees) async throws -> WeatherResponse {
		let apiKey = valueForAPIKey(named:"OPENWEATHER_API")
		guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lng)&exclude=minutely,daily,alerts&units=metric&appid=\(apiKey)") else { fatalError("URL not available") }
		
		let urlRequest = URLRequest(url: url)
		
		let (data, res) = try await URLSession.shared.data(for: urlRequest)
		
		guard (res as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Couldn't fetch data") }
		
		let decodedData = try JSONDecoder().decode(WeatherResponse.self, from: data)
		
		return decodedData
	}
}
