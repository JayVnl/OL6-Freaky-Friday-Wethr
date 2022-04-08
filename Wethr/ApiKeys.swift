//
//  ApiKeys.swift
//  Wethr
//
//  Created by Jorrit Verstappen on 08/04/2022.
//

import Foundation

func valueForAPIKey(named keyname:String) -> String {
	let filePath = Bundle.main.path(forResource: "ApiKeys", ofType: "plist")
	let plist = NSDictionary(contentsOfFile:filePath!)
	let value = plist?.object(forKey: keyname) as! String
	return value
}
