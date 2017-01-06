//
//  APIRouter.swift
//  Network
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//


import Alamofire

public typealias HTTPMethod = Alamofire.HTTPMethod
public typealias URLRequestConvertible = Alamofire.URLRequestConvertible
public typealias URLEncoding = Alamofire.URLEncoding

public protocol APIRouter: URLRequestConvertible {
	var method: HTTPMethod { get }
	var path: String { get }
	var params: [String: Any] { get }
	var baseUrl: URL { get }
	var headers: [String: String] { get }
}

extension APIRouter {
	public func asURLRequest() throws -> URLRequest {
		var request = URLRequest(url: self.baseUrl)
		request.httpMethod = self.method.rawValue
		request.timeoutInterval = 200
		
		for (key, value) in self.headers {
			request.setValue(value, forHTTPHeaderField: key)
		}
		
		var parameters: [String: AnyObject]?
		if self.method == .post || self.method == .patch || self.method == .put {
			do {
				request.httpBody = try JSONSerialization.data(withJSONObject: self.params, options: JSONSerialization.WritingOptions())
			} catch {
				// No-op
			}
		} else {
			parameters = params as [String : AnyObject]?
		}
		return try URLEncoding.default.encode(request, with: parameters)
	}
}

