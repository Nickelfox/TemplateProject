//
//  TestApiClient.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 06/01/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import Foundation
import FLAPIClient

class TestAPIClient: APIClient<AuthHeaders, ErrorResponse> {

	static let shared = TestAPIClient()
	
	override func parseAuthenticationHeaders(_ response: HTTPURLResponse) {
		self.authHeaders = try? AuthHeaders.parse(JSON(response.allHeaderFields as AnyObject))
	}
	
}
