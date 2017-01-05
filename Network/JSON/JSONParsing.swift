//
//  JSONParsing.swift
//  JSONParsing
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

public protocol JSONParsing {

	static func parse(_ json: JSON) throws -> Self

}

// JSONParsingPrimitive types get extracted directly with a type check

public protocol JSONParsingPrimitive: JSONParsing {}

public extension JSONParsingPrimitive {

	public static func parse(_ json: JSON) throws -> Self {
		if let object = json.object {
			if let res = object as? Self {
				return res
			} else {
				throw JSON.ParseError.typeMismatch(json: json)
			}
		} else {
			throw JSON.ParseError.noValue(json: json)
		}
	}

}

extension String: JSONParsingPrimitive {}

extension Bool: JSONParsingPrimitive {}

extension Int: JSONParsingPrimitive {}

extension Int8: JSONParsingPrimitive {}

extension Int16: JSONParsingPrimitive {}

extension Int32: JSONParsingPrimitive {}

extension Int64: JSONParsingPrimitive {}

extension Double: JSONParsingPrimitive {}

// JSONParsingRawString types are enums with JSONParsing-conforming RawType-s

public protocol JSONParsingRawRepresentable: RawRepresentable, JSONParsing {
	associatedtype RawValue: JSONParsing
}

public extension JSONParsingRawRepresentable {

	public static func parse(_ json: JSON) throws -> Self {
		if let enumVal = try Self(rawValue: json^) {
			return enumVal
		} else {
			throw JSON.ParseError.typeMismatch(json: json)
		}
	}

}
