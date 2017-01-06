//
//  AuthHeadersProtocol.swift
//  Network
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation
import Alamofire

public protocol AuthHeadersProtocol: JSONParsing, RequestAdapter {
	
	var isValid: Bool { get }
	
	func toJSON() -> [String: String]
	
}
