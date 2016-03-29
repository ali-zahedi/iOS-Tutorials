//: Playground - noun: a place where people can play
//
//  The Basics 5 - Enumeration
//
//  Created by Ali Zahedi on 1395/01/10 AP. 
//  Http://www.zahedi.pro
//  Copyright © 1395 Ali Zahedi. All rights reserved.
//

import UIKit

// Enumeration Syntax

enum SomeEnumeration {
    // enumeration definition goes here
}

// Enumeration Status
// Each enumeration definition defines a brand new type. Like other types in Swift, their names (such as SomeEnumeration and Status) should start with a capital letter

enum Status {
    
    case Active
    
    case Disable
    
}

// “Unlike C and Objective-C, Swift enumeration cases are not assigned a default integer value when they are created.”

// “Once gamer is declared as a Status, you can set it to a different Status value using a shorter dot syntax”
var gamer = Status.Disable
gamer = .Active


// “Multiple cases can appear on a single line, separated by commas”
enum Planet {

    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune

}


// “Matching Enumeration Values with a Switch Statement”
gamer = .Disable

switch gamer {
    
case .Active:
    
    print("The Gamer is active")
    
case .Disable:
    
    print("The Gamer is disable")
  
}

//“When it is not appropriate to provide a case for every enumeration case, you can provide a default case to cover any cases that are not addressed explicitl:”
let somePlanet = Planet.Earth

switch somePlanet {

case .Earth:
    
    print("Mostly harmless")

default:
    
    print("Not a safe place for humans")
}

// Associated Values
// “Some products are labeled with 1D barcodes in UPC-A format, which uses the numbers 0 to 9. Each barcode has a “number system” digit, followed by five “manufacturer code” digits and five “product code” digits.These are followed by a “check” digit to verify that the code has been scanned correctly”
// Refrences: http://www.barcodeisland.com/upca.phtml

// “Other products are labeled with 2D barcodes in QR code format, which can use any ISO 8859-1 character and can encode a string up to 2,953 characters long”

enum Barcode {
    
    case UPCA(Int, Int, Int, Int)
    
    case QRCode(String)

}

// 1D barcode or UPC-A
var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)

// 2D barcode or QRCode
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")

switch productBarcode {

case .UPCA(let numberSystem, let manufacturer, let product, let check):

    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
    
case .QRCode(let productCode):
    
    print("QR code: \(productCode).")
}

// “If all of the associated values for an enumeration case are extracted as constants, or if all are extracted as variables, you can place a single var or let annotation before the case name, for brevity”
switch productBarcode {

case let .UPCA(numberSystem, manufacturer, product, check):

    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")

case let .QRCode(productCode):

    print("QR code: \(productCode).")

}

// Raw Values
enum ASCIIControlCharacter: Character {

    case Tab = "\t"
    
    case LineFeed = "\n"
    
    case CarriageReturn = "\r"
}

// “Raw values are not the same as associated values. Raw values are set to prepopulated values when you first define the enumeration in your code, like the three ASCII codes above. The raw value for a particular enumeration case is always the same. Associated values are set when you create a new constant or variable based on one of the enumeration’s cases, and can be different each time you do so.”

// Implicitly Assigned Raw Values
// The enumeration below is a refinement of the earlier Planet enumeration, with integer raw values to represent each planet’s order from the sun

enum PlanetOrder: Int {
    
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

let mercuryOrder = PlanetOrder.Mercury.rawValue
let earthOrder = PlanetOrder.Earth.rawValue

print(mercuryOrder)
print(earthOrder)

enum CompassPoint: String {
    
    case North, South, East, West
}

let north = CompassPoint.North.rawValue

print(north)

// Initializing from a Raw Value
// “If you define an enumeration with a raw-value type, the enumeration automatically receives an initializer that takes a value of the raw value’s type (as a parameter called rawValue) and returns either an enumeration case or nil. You can use this initializer to try to create a new instance of the enumeration.”
// This example identifies Uranus from its raw value of 7:

let possiblePlanet = PlanetOrder(rawValue: 7)
print(possiblePlanet)

// “Not all possible Int values will find a matching planet, however. Because of this, the raw value initializer always returns an optional enumeration case”

// “NOTE: The raw value initializer is a failable initializer, because not every raw value will return an enumeration case. For more information, see Failable Initializers(https://developer.apple.com/swift/blog/?id=17).”

let positionToFind = 11

if let somePlanet = PlanetOrder(rawValue: positionToFind) {
    
    switch somePlanet {
    
    case .Earth:
    
        print("Mostly harmless")
    
    default:
    
        print("Not a safe place for humans")
    }
} else {
   
    print("There isn't a planet at position \(positionToFind)")
}