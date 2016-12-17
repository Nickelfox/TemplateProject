//
//  DemoObject.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 17/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation
import Network

final public class DemoObject {

}

extension DemoObject: JSONParsing {
	public static func parse(_ json: JSON) throws -> DemoObject {
		return DemoObject()
	}
}
