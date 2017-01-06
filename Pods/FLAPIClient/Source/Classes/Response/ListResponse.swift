//
//  ListResponse.swift
//  Network
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

public protocol ListResponseProtocol {
	
	static func listJSON(_ json: JSON) -> JSON
	
}

public final class ListResponse<T: JSONParsing> where T: ListResponseProtocol {
	var list: [T] = []
}

extension ListResponse: JSONParsing {
	
	public static func parse(_ json: JSON) throws -> ListResponse {
		let listJSON = T.listJSON(json).array
		do {
			let listResponse = ListResponse()
			listResponse.list = try listJSON.map(^)
			return listResponse
		} catch {
			throw error
		}
	}
	
}
