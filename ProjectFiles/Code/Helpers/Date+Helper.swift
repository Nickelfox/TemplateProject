//
//  Date+Helper.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 18/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

enum DateFormat: String {
	
	case yyyyMMdd = "yyyy-MM-dd"
	case ddMMyyyy = "dd-MM-yyyy"
	
}

struct DateHelper {
	static let dateFormatter = DateFormatter()
	
	static var today: Date {
		return DateHelper.shortStringFormatter.date(from: DateHelper.shortStringFormatter.string(from: Date()))!
	}
	
	private static let internalDateFormatter = DateFormatter()
	
	static var shortStringFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		return formatter
	}
	
	static func dateFormatter(format: DateFormat) -> DateFormatter {
		DateHelper.internalDateFormatter.dateFormat = format.rawValue
		return DateHelper.internalDateFormatter
	}
}
