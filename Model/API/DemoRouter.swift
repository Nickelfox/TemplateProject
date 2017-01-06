//
//  DemoRouter.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 05/01/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import Foundation
import FLAPIClient

public enum DemoRouter: APIRouter {
	case demo
	
	public var method: HTTPMethod {
		switch self {
		case .demo:
			return .get
		}
	}
	
	public var path: String {
		switch self {
		case .demo:
			return "/get"
		}
	}
	
	public var params: [String: Any] {
		switch self {
		case .demo:
			return [:]
		}
	}
	
	public var baseUrl: URL {
		let baseURL = URL(string: "https://httpbin.org")!
		return baseURL.appendingPathComponent(self.path)
	}
	
	public var headers: [String: String] {
		return ["Content-Type": "application/json"]
	}
	
}
