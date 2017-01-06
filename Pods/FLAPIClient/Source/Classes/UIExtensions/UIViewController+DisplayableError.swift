//
//  UIViewController+DisplayableError.swift
//  Network
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import UIKit

private class BasicError: DisplayableError {

	fileprivate var title: String
	fileprivate var message: String
	fileprivate var actionTitle: String

	init(title: String = APIErrorDefaults.title,
	     message: String = APIErrorDefaults.message,
	     actionTitle: String = APIErrorDefaults.actionTitle
		) {
		self.title = title
		self.message = message
		self.actionTitle = actionTitle
	}
}

extension BasicError: CustomStringConvertible {
	var description: String {
		return "Title=\(self.title) Message=\(self.message) ActionTitle=\(self.actionTitle)"
	}
}

public extension UIViewController {
	func presentError(
		title: String = APIErrorDefaults.title,
		description: String = APIErrorDefaults.message,
		actionTitle: String = APIErrorDefaults.actionTitle,
		animated: Bool = true,
		completion: (() -> ())? = nil) {
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
