//
//  DisplayableError.swift
//  Network
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

public protocol DisplayableError: Error {
	var title: String { get set }
	var message: String { get set }
	var actionTitle: String { get set }
}
