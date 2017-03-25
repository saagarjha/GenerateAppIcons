//
//  ImageSize.swift
//  GenerateAppIcons
//
//  Created by Saagar Jha on 3/25/17.
//  Copyright © 2017 Saagar Jha. All rights reserved.
//

import Foundation

enum ImageSize: CustomStringConvertible {
	case square(Double)
	case rectangle(Double, Double)
	
	var width: Double {
		switch self {
		case .square(let side):
			return side
		case .rectangle(let width, _):
			return width
		}
	}
	
	var height: Double {
		switch self {
		case .square(let side):
			return side
		case .rectangle(_, let height):
			return height
		}
	}
	
	var nsSize: NSSize {
		return NSSize(width: width, height: height)
	}
	
	private static let formatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.minimumFractionDigits = 0
		formatter.maximumFractionDigits = 1
		return formatter
	}()
	
	var description: String {
		guard let widthString = ImageSize.formatter.string(for: width as NSNumber),
			let heightString = ImageSize.formatter.string(for: height as NSNumber) else {
				assertionFailure("NumberFormatter could not create description for ImageSize")
				return ""
		}
		return "\(widthString)x\(heightString)"
	}
}
