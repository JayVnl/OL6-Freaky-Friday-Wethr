//
//  Extensions.swift
//  Wethr
//
//  Created by Jorrit Verstappen on 08/04/2022.
//

import Foundation

extension Double {
	func roundDouble() -> String {
		return String(format: "%.0f", self)
	}
	func convertToKmPerHour() -> String {
		return String(format: "%.0f", self * 3.6)
	}
	func convertToCompassDirection() -> String {
		switch self {
		case 0...22:
			return "N"
		case 23...67:
			return "NE"
		case 68...112:
			return "E"
		case 113...157:
			return "SE"
		case 158...202:
			return "S"
		case 203...247:
			return "SW"
		case 248...292:
			return "W"
		case 293...337:
			return "NW"
		case 338...360:
			return "N"
			
		default:
			return "?"
		}
	}
}

extension Int {
	func toHour() -> String {
		let epocTime = TimeInterval(self)
		let date = NSDate(timeIntervalSince1970: epocTime)
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "HH:mm"

		return dateFormatter.string(from: date as Date)
	}
}
