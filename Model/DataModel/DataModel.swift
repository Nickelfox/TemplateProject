//
//  DataModel.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 05/01/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import Foundation
import FLAPIClient

public typealias APICompletion<T> = (T?, APIError?) -> Void

public class  DataModel {
	
	public static func test(completion: @escaping APICompletion<DemoObject>) {
		
		TestAPIClient.shared.request(
			route: DemoRouter.demo,
			completion: completion
		)
		
	}
	
}
