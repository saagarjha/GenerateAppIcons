//
//  Image.swift
//  GenerateAppIcons
//
//  Created by Saagar Jha on 3/25/17.
//  Copyright © 2017 Saagar Jha. All rights reserved.
//

import Foundation

struct Image {
	let size: ImageSize
	let scales: [Int]
	let idiom: String
	let role: String?
	let subtype: String?
}
