//
//  APIError.swift
//  Network
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

public protocol APIErrorProtocol {
	var error: APIError { get }
}

public class APIError: DisplayableError {
	static let errorDomain = "com.api.error"
	
	public var code: APIErrorCode
	public var title: String
	public var message: String
	public var actionTitle: String

	public init(
		code: APIErrorCode = APIErrorDefaults.code,
		title: String = APIErrorDefaults.title,
		message: String = APIErrorDefaults.message,
		actionTitle: String = APIErrorDefaults.actionTitle
		) {
		self.code = code
		self.title = title
		self.message = message
		self.actionTitle = actionTitle
	}
	
}

public extension NSError {
	
	var apiError: APIError {
		return APIError(
			code: .other(code: self.code),
			title: self.domain,
			message: (self.userInfo[NSLocalizedDescriptionKey] as? String) ?? APIErrorDefaults.message,
			actionTitle: APIErrorDefaults.actionTitle
		)
	}
	
}
