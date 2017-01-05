//
//  Analytics.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 18/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

private let timeInSessionKey = "Time_In_Session"
private let timeInSessionParamKey = "Time_In_Minutes"

class Analytics: NSObject {
	
	static let sharedInstance = Analytics()
	
	fileprivate var activeTime = Date()
	
	override init() {
		super.init()
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(handleAppDidBecomeActive),
			name: NSNotification.Name.UIApplicationDidBecomeActive,
			object: nil
		)
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(handleAppWillGoToBackground),
			name: NSNotification.Name.UIApplicationDidBecomeActive,
			object: nil
		)
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(handleAppWillTerminate),
			name: NSNotification.Name.UIApplicationDidBecomeActive,
			object: nil
		)
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
	func setup() {
		#if !DEBUG
			//Initialise Analytics here
		#endif
	}
	
	@objc private func handleAppDidBecomeActive() {
		activeTime = Date()
	}
	
	@objc private func handleAppWillGoToBackground() {
		handleAppWillLooseFocus()
	}
	
	@objc private func handleAppWillTerminate() {
		handleAppWillLooseFocus()
	}
	
	private func handleAppWillLooseFocus() {
		Analytics.trackTimeInLastSession(startTime: activeTime, endTime: Date())
	}
	
	static func screen(_ title: String, properties: [String: Any]? = nil) {

	}
	
	static func track(_ event: String, properties: [String: Any]? = nil) {

	}
	
}

//MARK:
extension Analytics {
	
	static func trackTimeInLastSession(startTime: Date, endTime: Date) {
		let timeInterval = endTime.timeIntervalSince(startTime)
		let timeIntervalInMinutes = Int(ceil(timeInterval / 60))
		Analytics.track(timeInSessionKey, properties: [timeInSessionParamKey: "\(timeIntervalInMinutes)"])
	}
	
	static func track(event: AnalyticsEvent) {
		Analytics.track(event.description, properties: event.parameters)
	}
	
}

enum AnalyticsEvent: CustomStringConvertible {
	case demo(title: String)
	
	
	var description: String {
		switch self {
		case .demo:
			return "Video Play"
		}
	}
	
	var parameters: [String: Any]? {
		switch self {
		case .demo(let title):
			return ["title": title]
		}
	}
	
}
