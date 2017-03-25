//
//  main.swift
//  GenerateAppIcons
//
//  Created by Saagar Jha on 3/24/17.
//  Copyright © 2017 Saagar Jha. All rights reserved.
//

import AppKit

var args = CommandLine.arguments.dropFirst()
let index = args.partition { $0.hasPrefix("-") }
let arguments = Array(args[args.startIndex..<index])
let flags = Array(args[index..<args.endIndex])

guard flags.count > 0 && arguments.count > 0 else {
	printToError("Error: no image or image sets specified.")
	exit(GAIError.noArguments.rawValue)
}

var imagePath = ""
var outputPath = "AppIcon.appiconset"

switch arguments.count {
case 2...Int.max:
	outputPath = arguments[1]
	fallthrough
case 1:
	imagePath = arguments[0]
default:
	break
}

var force = false
var imageSet = [Image]()

for flag in flags {
	switch flag {
	case "-f":
		force = true
	case "-h":
		printHeader()
		printOptions()
		exit(GAIError.success.rawValue)
	case "-i":
		imageSet.append(contentsOf: iPhoneImageSet)
	case "-i1":
		imageSet.append(contentsOf: iPhone1ImageSet)
	case "-i7":
		imageSet.append(contentsOf: iPhone7ImageSet)
	case "-p":
		imageSet.append(contentsOf: iPadImageSet)
	case "-p32":
		imageSet.append(contentsOf: iPad32ImageSet)
	case "-p7":
		imageSet.append(contentsOf: iPad7ImageSet)
	case "-w":
		imageSet.append(contentsOf: appleWatchImageSet)
	case "-w1":
		imageSet.append(contentsOf: appleWatch1ImageSet)
	case "-w2":
		imageSet.append(contentsOf: appleWatch2ImageSet)
	default:
		printToError("Invalid option. Valid options are:")
		printOptions()
		exit(GAIError.invalidOption.rawValue)
	}
}

let imageURL = URL(fileURLWithPath: NSString(string: imagePath).expandingTildeInPath)
let outputURL = URL(fileURLWithPath: NSString(string: outputPath).expandingTildeInPath, isDirectory: true)

if FileManager.default.fileExists(atPath: outputURL.path) {
	if force {
		try FileManager.default.removeItem(at: outputURL)
	} else {
		printToError("A file called \(outputPath) already exists. Stopping.")
		exit(GAIError.fileExists.rawValue)

	}
}

do {
	try FileManager.default.createDirectory(at: outputURL, withIntermediateDirectories: false, attributes: nil)
} catch _ {
	printToError("Could not create a file called \(outputPath). Stopping.")
	exit(GAIError.fileCreationFailure.rawValue)
}

let image = NSImage(contentsOf: imageURL)

var json: [String: Any] = ["info": ["version": 1, "author": "xcode"]]
var jsonImages = [[String: Any]]()

for img in imageSet {
	for scale in img.scales {
		let fileName = "\(Int(img.size.width * Double(scale)))x\(Int(img.size.height * Double(scale))).png"
		if let resizedImage = image?.resized(to: img.size.nsSize, scalingBy: scale),
			resizedImage.saveAsPNG(to: outputURL.appendingPathComponent(fileName)) {
			var jsonImage = [
				"filename": fileName,
				"size": img.size.description,
				"scale": "\(scale)x",
				"idiom": img.idiom,
			]
			if let role = img.role {
				jsonImage["role"] = role
			}
			if let subtype = img.subtype {
				jsonImage["subtype"] = subtype
			}
			jsonImages.append(jsonImage)
		} else {
			printToError("Could not create \(outputPath)/\(fileName), skipping…")
		}
	}
}

json["images"] = jsonImages

do {
	let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
	let url = outputURL.appendingPathComponent("Contents.json")
	try data.write(to: url)
} catch _ {
	printToError("Could not create \(outputPath).Contents.json, skipping…")
}
