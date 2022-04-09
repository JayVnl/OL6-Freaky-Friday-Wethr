//
//  WeatherResponse.swift
//  Wethr
//
//  Created by Jorrit Verstappen on 08/04/2022.
//

import Foundation

struct WeatherResponse: Decodable {
	var lat: Double
	var lon: Double
	var current: Weather
	var hourly: [Weather]
	
	struct Weather: Decodable {
		var dt: Int
		var temp: Double
		var wind_speed: Double
		var wind_deg: Double
		var weather: [WeatherType]
	}
	
	struct WeatherType: Decodable {
		var id: Double
		var main: String
		var description: String
		var icon: String
	}
}
