//
//  UIViewController+DisplayableError.swift
//  Network
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import UIKit

private let DefaultTitle = "Error"
private let DefaultMessage = "An unknown error occured."
private let DefaultButtonTitle = "Ok"

private class BasicError: DisplayableError {

	fileprivate var title: String
	fileprivate var message: String
	fileprivate var actionTitle: String

	init(title: String?, message: String?, actionTitle: String?) {
		self.title = title ?? DefaultTitle
		self.message = message ?? DefaultMessage
		self.actionTitle = actionTitle ?? DefaultButtonTitle
	}
}

extension BasicError: CustomStringConvertible {
	var description: String {
		return "Title=\(self.title) Message=\(self.message) ActionTitle=\(self.actionTitle)"
	}
}

public extension UIViewController {
	func presentError(withTitle title: String? = nil, description: String? = nil,
				actionTitle: String? = nil, animated: Bool = true, completion: (() -> ())? = nil) {
		self.presentError(
			BasicError(
				title: title,
				message: description,
				actionTitle: actionTitle
			),
			animated: animated,
			completion: completion)
	}

	func presentError(_ error: DisplayableError, animated: Bool = true, completion: (() -> ())? = nil) {
		self.present(UIAlertController(error: error, completion: completion), animated: animated, completion: nil)
	}
}
