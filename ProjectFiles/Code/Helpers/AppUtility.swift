//
//  AppUtility.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 18/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

struct AppUtility {
	static var appVersion: String {
		return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
	}
}
