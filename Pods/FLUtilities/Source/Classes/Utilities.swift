//
//  Utilities.swift
//  FLUtilities
//
//  Created by Ravindra Soni on 17/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation

func localizedString(_ key: String) -> String {
	return NSLocalizedString(key, comment: key)
}

func delay(_ delay:Double, closure:@escaping ()->()) {
	DispatchQueue.main.asyncAfter(
		deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

func onMainThread(_ execute: @escaping () -> Void) {
	DispatchQueue.main.async {() -> Void in
		execute()
	}
}
