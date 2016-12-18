//
//  NavigationBar.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 18/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation
import FLUtilities

private let barTintColor = UIColor.green
private let backImage: UIImage?  = nil

class NavigationBar: UINavigationBar {
	
	override func awakeFromNib() {
		super.awakeFromNib()
		if let backImage = backImage {
			self.backIndicatorImage = backImage
			self.backIndicatorTransitionMaskImage = backImage
		}
		self.barTintColor = barTintColor
		self.tintColor = UIColor.white
		self.applyShadow(apply: true)
	}
	
}
