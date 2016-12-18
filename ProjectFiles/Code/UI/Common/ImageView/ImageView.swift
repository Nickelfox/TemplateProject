//
//  ImageView.swift
//  TemplateProject
//
//  Created by Ravindra Soni on 18/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

public class ImageView: UIImageView {
	
	let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
	var downloadImageCompletion: SDWebImageQueryCompletedBlock?
	
	public override func awakeFromNib() {
		super.awakeFromNib()
		self.addSubview(self.activity)
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		self.activity.frame = self.bounds;
	}
	
	public func setImageFromUrl(urlString: String, placeHolder: UIImage? = nil) {
		guard let url = URL(string: urlString) else {
			return
		}
		
		let options: SDWebImageOptions = [
			.continueInBackground,
			.highPriority,
			.progressiveDownload,
			.refreshCached,
			.retryFailed
		]
		self.image = placeHolder
		self.startLoader()
		
		self.sd_setImage(
			with: url,
			placeholderImage: placeHolder,
			options: options) { [weak self] (image, _, _, _) in
				guard let this = self else { return }
				this.image = image
				this.stopLoader()
		}
		
	}
	
	private func startLoader() {
		activity.isHidden = false
		activity.startAnimating()
	}
	
	private func stopLoader() {
		activity.isHidden = true
		activity.stopAnimating()
	}
}
