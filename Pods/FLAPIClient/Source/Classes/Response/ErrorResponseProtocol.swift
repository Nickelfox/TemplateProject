//
//  ErrorResponseProtocol.swift
//  Network
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

public protocol ErrorResponseProtocol: APIErrorProtocol {
	static func parse(_ json: JSON, code: Int) throws -> Self
}
