//: Playground - noun: a place where people can play
//
//  The Basic8 - Classes and Structures - Methods
//
//  Created by Ali Zahedi on 1395/02/24 AP.
//  Http://www.zahedi.pro
//  Copyright © 1395 Ali Zahedi. All rights reserved.
//

import UIKit

// Instance Methods
class Counter {
    
    var count = 0
    
    func increment() {
    
        count += 1
    
    }
    
    func incrementBy(amount: Int) {
    
        count += amount
    
    }
    
    func reset() {
    
        count = 0
    
    }
}

let counter = Counter()

counter.increment()

counter.incrementBy(5)

print(counter.count)

counter.reset()

print(counter.count)

// Local and External Parameter Names for Methods
class CounterSecond {
    
    var count: Int = 0
    
    func incrementBy( amount: Int, numberOfTimes: Int) {
    
        count += amount * numberOfTimes
    
    }
}


let counterSecond = CounterSecond()
counterSecond.incrementBy( 5, numberOfTimes: 3)

// The self Property
struct Point {

    var x = 0.0, y = 0.0

    func isToTheRightOfX(x: Double) -> Bool {
    
        return self.x > x
    
    }
}

let somePoint = Point(x: 4.0, y: 5.0)

if somePoint.isToTheRightOfX(1.0) {

    print("This point is to the right of the line where x == 1.0")

}

// Modifying Value Types from Within Instance Methods
struct PointSecond {

    var x = 0.0, y = 0.0
    
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
    
        x += deltaX
        y += deltaY
    
    }
}

var somePointSecond = PointSecond(x: 1.0, y: 1.0)

somePointSecond.moveByX(2.0, y: 3.0)

print("The point is now at (\(somePoint.x), \(somePoint.y))")

// Assigning to self Within a Mutating Method
enum TriStateSwitch {
    
    case Off, Low, High
    
    mutating func next() {
    
        switch self {
        
        case Off:
            self = Low
        
        case Low:
            self = High
        
        case High:
            self = Off
        }
    }
}

var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()
print(ovenLight)

// Type Methods, static, class
class SomeClass {

    class func someTypeMethod() {
        // type method implementation goes here
    
    }
}

SomeClass.someTypeMethod()

struct LevelTracker {

    static var highestUnlockedLevel = 1
    
    static func unlockLevel(level: Int) {
    
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    
    }
    
    static func levelIsUnlocked(level: Int) -> Bool {
    
        return level <= highestUnlockedLevel
    }
    
    var currentLevel = 1
    
    mutating func advanceToLevel(level: Int) -> Bool {
    
        if LevelTracker.levelIsUnlocked(level) {
        
            currentLevel = level
            
            return true
        } else {
        
            return false
        }
    }
}

class Player {

    var tracker = LevelTracker()
    
    let playerName: String
    
    func completedLevel(level: Int) {
    
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }

    init(name: String) {
    
        playerName = name
    }
}

var player = Player(name: "Argyrios")

player.completedLevel(1)

print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")

if player.tracker.advanceToLevel(6) {

    print("player is now on level 6")
} else {

    print("level 6 has not yet been unlocked")
}





