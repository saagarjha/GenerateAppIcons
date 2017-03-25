//
//  +NSImage.swift
//  GenerateAppIcons
//
//  Created by Saagar Jha on 3/25/17.
//  Copyright © 2017 Saagar Jha. All rights reserved.
//

import AppKit

extension NSImage {
	func resized(to size: NSSize, scalingBy scale: Int) -> NSImage? {
		let scaledSize = size.scaled(by: scale)
		guard let representation = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: Int(scaledSize.width), pixelsHigh: Int(scaledSize.height), bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: NSCalibratedRGBColorSpace, bytesPerRow: 0, bitsPerPixel: 0) else {
			return nil
		}
		representation.size = size
		NSGraphicsContext.saveGraphicsState()
		NSGraphicsContext.setCurrent(NSGraphicsContext(bitmapImageRep: representation))
		draw(in: NSRect(origin: .zero, size: size), from: NSRect(origin: .zero, size: self.size), operation: .copy, fraction: 1)
		NSGraphicsContext.restoreGraphicsState()
		let image = NSImage(size: scaledSize)
		image.addRepresentation(representation)
		return image
	}
	
	func saveAsPNG(to url: URL) -> Bool {
		guard let tiffData = tiffRepresentation else {
			return false
		}
		let representation = NSBitmapImageRep(data: tiffData)
		let properties = [NSImageCompressionFactor: 1]
		guard let pngData = representation?.representation(using: NSPNGFileType, properties: properties) else {
			return false
		}
		do {
			try pngData.write(to: url)
			return true
		} catch _ {
			return false
		}
	}
}
