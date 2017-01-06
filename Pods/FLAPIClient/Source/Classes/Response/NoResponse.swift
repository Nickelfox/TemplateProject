//
//  NoResponse.swift
//  Network
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

public struct NoResponse: JSONParsing {
	public static func parse(_ json: JSON) throws -> NoResponse {
		return NoResponse()
	}
}
