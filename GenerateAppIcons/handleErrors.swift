//
//  handleErrors.swift
//  GenerateAppIcons
//
//  Created by Saagar Jha on 3/25/17.
//  Copyright © 2017 Saagar Jha. All rights reserved.
//

import Foundation

enum GAIError: Int32 {
	case success = 0
	case noArguments
	case invalidOption
	case fileExists
	case fileCreationFailure
}

func printToError(_ string: String = "") {
	guard let data = "\(string)\n".data(using: .utf8) else {
		return
	}
	FileHandle.standardError.write(data)
}

func printHeader() {
	printToError("A simple command line app icon generator")
}

func printOptionsHeader() {
	printToError()
	printToError("USAGE: generate-appicons option[s] iconfile [output=AppIcon.appiconset]")
	printToError()
	printToError("OPTIONS:")
}

func printOptions() {
	printToError(" -f    Overwrite files if necessary")
	printToError(" -i    Generate iPhone icons")
	printToError(" -i7   Generate iPhone icons for iOS 7+")
	printToError(" -i1   Generate iPhone icons for iOS 1+")
	printToError(" -im   Generate iOS marketing icons")
	printToError(" -p    Generate iPad icons")
	printToError(" -p7   Generate iPad icons for iOS 7+")
	printToError(" -p32  Generate iPad icons for iOS 3.2+")
	printToError(" -w    Generate Apple Watch icons")
	printToError(" -w2   Generate Apple Watch icons for watchOS 2+")
	printToError(" -w1   Generate Apple Watch icons for watchOS 1+")
	printToError(" -wm   Generate Apple Watch marketing icons")
}
