//
//  APIErrorDefaults.swift
//  Network
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

public struct APIErrorDefaults {
	static let code = APIErrorCode.unknown
	static let title = "Error"
	static let message = "An unknown error has occured."
	static let actionTitle = "Ok"
	
	static let mappingErrorTitle = "Mapping Error"
	static let mappingErrorMessage = "An unknown error occured while mapping response"
}

