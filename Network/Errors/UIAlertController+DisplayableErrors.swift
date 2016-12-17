//
//  UIAlertController+DisplayableErrors.swift
//  Network
//
//  Created by Ravindra Soni on 16/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import UIKit

public extension UIAlertController {

	convenience init(error: DisplayableError, completion: (() -> ())? = nil) {
		self.init(
			title: error.title,
			message: error.message,
			preferredStyle: .alert
		)
		self.addAction(
			UIAlertAction(
				title: error.actionTitle,
				style: .cancel,
				handler: { _ in
					completion?()
			})
		)
	}
}
