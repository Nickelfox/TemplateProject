//
//  APIErrorType.swift
//  Network
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

public enum APIErrorCode: Int {
	case other = 1000
	case noInternet = 1001
	case mapping = 1002
	case unauthorized = 1003
	case serverDown = 1004
}

public enum APIErrorType: APIErrorProtocol {
	case unknown
	case noInternet
	case unauthorized
	case mapping(message: String?)
	case serverDown
	
	public var error: APIError {
		var title = APIErrorDefaults.title
		var message = APIErrorDefaults.message
		var actionTitle = APIErrorDefaults.actionTitle
		var code = APIErrorDefaults.code
		switch self {
		case .mapping (let msg):
			title = APIErrorDefaults.mappingErrorTitle
			message = msg ?? APIErrorDefaults.mappingErrorMessage
			actionTitle = APIErrorDefaults.actionTitle
			code = .mapping
		case .noInternet:
			message = "No Internet Connection! Check your internet connection"
			code = .noInternet
		case .unauthorized:
			message = "Sorry! Your session has expired. Please login and try again."
			code = .unauthorized
		case .unknown:
			code = .other
		case .serverDown:
			message = "Sorry! Your servers are under maintenance right now. Please try again later."
			code = .serverDown
		}
		return APIError(code: code, title: title, message: message, actionTitle: actionTitle)
	}

}
