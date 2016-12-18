//
//  UIView+Helper.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 18/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import UIKit

extension UIView {
	
	@IBInspectable var borderWidth: CGFloat {
		get {
			return 1.0
		} set {
			self.layer.borderWidth = newValue
		}
	}
	
	@IBInspectable var borderColor: UIColor {
		get {
			return UIColor.black
		} set {
			self.layer.borderColor = newValue.cgColor
		}
	}
	
	@IBInspectable var cornerRadius: CGFloat {
		get {
			return 1.0
		} set {
			self.layer.cornerRadius = newValue
			self.layer.masksToBounds = true
		}
	}
	
	func flipView() {
		let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
		
		UIView.transition(with: self, duration: 1.0, options: transitionOptions, animations: {
			self.isHidden = true
		}, completion: nil)
		
		UIView.transition(with: self, duration: 1.0, options: transitionOptions, animations: {
			self.isHidden = false
		}, completion: nil)
	}

}
