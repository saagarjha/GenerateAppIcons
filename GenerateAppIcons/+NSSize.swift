//
//  +NSSize.swift
//  GenerateAppIcons
//
//  Created by Saagar Jha on 3/25/17.
//  Copyright © 2017 Saagar Jha. All rights reserved.
//

import Foundation

extension NSSize {
	func scaled(by scale: Int) -> NSSize {
		return NSSize(width: width * CGFloat(scale), height: height * CGFloat(scale))
	}
}
