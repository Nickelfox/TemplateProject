//
//  DemoObject.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 05/01/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import Foundation
import FLAPIClient

final public class DemoObject {
	
}

extension DemoObject: JSONParsing {
	public static func parse(_ json: JSON) throws -> DemoObject {
		return DemoObject()
	}
}
