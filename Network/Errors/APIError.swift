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
	
	func error(code: APIErrorCode?, title: String?, message: String?, actionTitle: String?) -> APIError
}

extension APIErrorProtocol {

	public func error(code: APIErrorCode? = nil, title: String? = nil, message: String? = nil, actionTitle: String? = nil) -> APIError {
		return APIError(code: code, title: title, message: message, actionTitle: actionTitle)
	}

}

public class APIError: DisplayableError {
	static let errorDomain = "com.api.error"
	
	public var code: APIErrorCode
	public var title: String
	public var message: String
	public var actionTitle: String

	public init(code: APIErrorCode? = nil, title: String?, message: String?, actionTitle: String?) {
		self.code = code ?? APIErrorDefaults.code
		self.title = title ?? APIErrorDefaults.title
		self.message = message ?? APIErrorDefaults.message
		self.actionTitle = actionTitle ?? APIErrorDefaults.actionTitle
	}
	
}

public extension NSError {
	
	var apiError: APIError {
		return APIError(
			title: self.domain,
			message: self.userInfo[NSLocalizedDescriptionKey] as? String,
			actionTitle: nil
		)
	}
	
}
