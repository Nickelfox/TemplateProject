//
//  ErrorResponse.swift
//  Network
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

private let errorTypeKey = "error_type"
private let errorsKey = "errors"
private let errorKey = "error"
private let errorMessageKey = "message"
private let codeKey = "status_code"

public struct ErrorResponse {
	public let messages: [String]

	public var compiledErrorMessage: String {
		return self.messages.joined(separator: ",")
	}
}

extension ErrorResponse: JSONParsing {
	public static func parse(_ json: JSON) throws -> ErrorResponse {
		let unknownError = APIErrorType.mapping(message: "Error Response can't be mapped.").error
		if let infoDict = json[errorsKey].object as? [String: Any] {
			var lastKey: String?
			for key in infoDict.keys {
				lastKey = key
			}
			if let key = lastKey {
				return try ErrorResponse(
					messages: json[errorsKey][key].array.map(^)
				)
			} else {
				throw unknownError
			}
		} else if let _ = json[errorsKey].object as? [String] {
			return try ErrorResponse(
				messages: json[errorsKey].array.map(^)
			)
		} else if let _ = json[errorKey].object {
			return try ErrorResponse(
				messages: json[errorKey].array.map(^)
			)
		} else {
			throw unknownError
		}
	}
}

