//
//  ListResponse.swift
//  Network
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

public final class ListResponse<T: JSONParsing> {
	var list: [T] = []
}

extension ListResponse: JSONParsing {
	
	public static func parse(_ json: JSON) throws -> ListResponse {

		do {
			let listResponse = ListResponse()
			listResponse.list = try json.array.map(^)
			return listResponse
		} catch {
			throw error
		}
	}
	
}
