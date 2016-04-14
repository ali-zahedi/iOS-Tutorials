//: Playground - noun: a place where people can play
//
//  The Basic6 - Classes and Structures
//
//  Created by Ali Zahedi on 1395/01/26 AP.
//  Http://www.zahedi.pro
//  Copyright © 1395 Ali Zahedi. All rights reserved.
//

import UIKit

// “Classes and structures are general-purpose, flexible constructs that become the building blocks of your program’s code. You define properties and methods to add functionality to your classes and structures by using exactly the same syntax as for constants, variables, and functions.”
//
// Definition Syntax

// NOTE
// Whenever you define a new class or structure, you effectively define a brand new Swift type. Give types UpperCamelCase names (such as SomeClass and SomeStructure here) to match the capitalization of standard Swift types (such as String, Int, and Bool). Conversely, always give properties and methods lowerCamelCase names (such as frameRate and incrementCount) to differentiate them from type names.


class SomeClass {
    // class definition goes here
}

struct SomeStructure {
    // structure definition goes here
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// Class and Structure Instances
let someResolution = Resolution()
let someVideoMode = VideoMode()

// Class and structure initialization is described in more detail in Initialization.

// Accessing Properties
print("The width of someResolution is \(someResolution.width)")

// drill down into sub-properties
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

// assign a new value to property
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

// Memberwise Initializers for Structure Types
// All structures have an automatically-generated memberwise initializer, which you can use to initialize the member properties of new structure instances. Initial values for the properties of the new instance can be passed to the memberwise initializer by name:

let vga = Resolution(width: 640, height: 480)
// Unlike structures, class instances do not receive a default memberwise initializer.

// Structures and Enumerations Are Value Types
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048

print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

// Classes Are Reference Types
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

// Identity Operators

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}


// Choosing Between Classes and Structures

// Assignment and Copy Behavior for Strings, Arrays, and Dictionaries
var str: String = "This is a string"
var cpStr: String = str
cpStr = "This is a second string"

print(cpStr)
print(str)



