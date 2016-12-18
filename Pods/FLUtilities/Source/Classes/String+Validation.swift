//
//  String+Validation.swift
//  FLUtilities
//
//  Created by Ravindra Soni on 18/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

private let kAlphabeticRegex = "[a-zA-Z\\s]+"
private let kAlphaNumericRegex = "[a-zA-Z0-9\\s]+"
private let kEmailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

public extension String {
	
	fileprivate func matchRegex(regex: String) -> Bool {
		let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
		return predicate.evaluate(with: self)
	}
	
	var isNonempty: Bool {
		return !self.isEmpty
	}
	
	var isPhone: Bool {
		return self.characters.count <= 14 && self.characters.count >= 10
	}
	
	
	var isAlphabetic: Bool {
		return self.matchRegex(regex: kAlphabeticRegex)
	}
	
	var isNumeric: Bool {
		if self.isEmpty {
			return false
		}
		let notDigits = NSCharacterSet.decimalDigits.inverted
		return (self.rangeOfCharacter(from: notDigits) == nil)
	}
	
	var isAlphanumeric: Bool {
		return self.matchRegex(regex: kAlphaNumericRegex)
	}
	
	var isValidEmail: Bool {
		return self.matchRegex(regex: kEmailRegex)
	}
	
	var isValidURL: Bool {
		if let url = URL(string: self) {
			if let _ = url.scheme, let _ = url.host {
				return true
			} else {
				return false
			}
		} else {
			return false
		}
	}
	
	var isValidPassword: Bool {
		return self.characters.count >= 8;
	}
	
}
