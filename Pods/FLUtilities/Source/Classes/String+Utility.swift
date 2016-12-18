//
//  String+Utility.swift
//  FLUtilities
//
//  Created by Ravindra Soni on 18/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

public extension String {

	func capitalizingFirstLetter() -> String {
		let first = String(characters.prefix(1)).capitalized
		let other = String(characters.dropFirst())
		return first + other
	}
	
	mutating func capitalizeFirstLetter() {
		self = self.capitalizingFirstLetter()
	}
	
}
