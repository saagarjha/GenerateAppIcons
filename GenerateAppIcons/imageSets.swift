//
//  imageSets.swift
//  GenerateAppIcons
//
//  Created by Saagar Jha on 3/25/17.
//  Copyright © 2017 Saagar Jha. All rights reserved.
//

let iPhone7ImageSet = [
	Image(size: .square(20), scales: [2, 3], idiom: "iphone", role: nil, subtype: nil),
	Image(size: .square(29), scales: [2, 3], idiom: "iphone", role: nil, subtype: nil),
	Image(size: .square(40), scales: [2, 3], idiom: "iphone", role: nil, subtype: nil),
	Image(size: .square(60), scales: [2, 3], idiom: "iphone", role: nil, subtype: nil),
]

let iPhone1ImageSet = iPhone7ImageSet + [
	Image(size: .square(29), scales: [1], idiom: "iphone", role: nil, subtype: nil),
	Image(size: .square(57), scales: [1, 2], idiom: "iphone", role: nil, subtype: nil),
]

let iPhoneImageSet = iPhone7ImageSet

let iPad7ImageSet = [
	Image(size: .square(20), scales: [1, 2], idiom: "ipad", role: nil, subtype: nil),
	Image(size: .square(29), scales: [1, 2], idiom: "ipad", role: nil, subtype: nil),
	Image(size: .square(40), scales: [1, 2], idiom: "ipad", role: nil, subtype: nil),
	Image(size: .square(76), scales: [1, 2], idiom: "ipad", role: nil, subtype: nil),
	Image(size: .square(83.5), scales: [2], idiom: "ipad", role: nil, subtype: nil),
]

let iPad32ImageSet = iPad7ImageSet + [
	Image(size: .square(50), scales: [1, 2], idiom: "ipad", role: nil, subtype: nil),
	Image(size: .square(72), scales: [1, 2], idiom: "ipad", role: nil, subtype: nil),
]

let iPadImageSet = iPad7ImageSet

let appleWatch2ImageSet = [
	Image(size: .square(24), scales: [2], idiom: "watch", role: "notificationCenter", subtype: "38mm"),
	Image(size: .square(27.5), scales: [2], idiom: "watch", role: "notificationCenter", subtype: "42mm"),
	Image(size: .square(29), scales: [2, 3], idiom: "watch", role: "companionSettings", subtype: nil),
	Image(size: .square(40), scales: [2], idiom: "watch", role: "appLauncher", subtype: "38mm"),
	Image(size: .square(86), scales: [2], idiom: "watch", role: "quickLook", subtype: "38mm"),
	Image(size: .square(98), scales: [2], idiom: "watch", role: "quickLook", subtype: "42mm"),
]

let appleWatch1ImageSet = appleWatch2ImageSet + [
	Image(size: .square(44), scales: [2], idiom: "watch", role: "longLook", subtype: "42mm"),
]

let appleWatchImageSet = appleWatch2ImageSet
