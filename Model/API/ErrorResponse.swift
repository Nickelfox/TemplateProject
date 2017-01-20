//
//  ErrorResponse.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 05/01/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import Foundation
import FLAPIClient

private let errorKey = "error"

public struct ErrorResponse: ErrorResponseProtocol {
	public static func parse(_ json: JSON, code: Int) throws -> ErrorResponse {
		let unknownError = APIErrorType.mapping(message: "Error Response can't be mapped.").error
//		if true { // Check for condition and parse error ere else throw unknown error
//			return ErrorResponse.init(code: .unknown, messages: ["Unknown Error"])
//		} else {
//			throw unknownError
//		}
		throw unknownError
	}

	public var code: APIErrorCode
	public let messages: [String]
	
	public var compiledErrorMessage: String {
		return self.messages.joined(separator: ",")
	}
}

public extension ErrorResponse {
	
	var error: APIError {
		return APIError(
			code: self.code,
			message: self.compiledErrorMessage
		)
	}
	
}
