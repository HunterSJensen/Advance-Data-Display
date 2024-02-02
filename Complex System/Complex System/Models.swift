//
//  Models.swift
//  Complex System
//
//  Created by Hunter Jensen on 1/30/24.
//

import Foundation

//struct Pieces {
//    var name: String
//    var piece: String
//}


//protocol SurfaceArea {
//    func area() -> Double
//}


//Dependency Inversion
protocol SaveRolls {
    func save( _ saveRolls: Int)
    func getRolls() -> Int
}

class AllRolls: SaveRolls {
    private var totalRolls: Int = 0
    
    func save(_ saveRolls: Int) {
        totalRolls += saveRolls
    }
    
    func getRolls() -> Int {
        return totalRolls
    }
}

class RollsStorage: SaveRolls {
    private var rolls: Int = 0
    func save(_ saveRolls: Int) {
        rolls += saveRolls
    }
    func getRolls() -> Int {
        return rolls
    }
}

class LogRolls {
    private let saveRolls: SaveRolls
    init(saveRolls: SaveRolls) {
        self.saveRolls = saveRolls
    }
    
    func log(_ data: Int) {
        saveRolls.save(data)
        print("Data Logged \(data)")
    }
}

//Open/Closed
protocol Rollable {
    func Roll() -> String
}


class GameObject {
    func gameTime() -> String {
        return "Time To Play!"
    }

}
class Dice: GameObject, Rollable {
    override func gameTime() -> String {
        
        return "You just rolled the dice next players turn"
    }

    func randomNumber() -> Int {
        return Int.random(in: 1..<12)
    }
    
    // Open/Closed
    func Roll() -> String {
        return "You Rolled \(randomNumber()), \(gameTime())"
    }
}


class Marble: GameObject, Rollable{
    
    // Open/Closed
    override func gameTime() -> String {
        return "You just threw the marble next players turn"
    }
    func randomNumber() -> Int {
        return Int.random(in: 1..<42)
    }
    
    func Roll() -> String {
        return "Your Marble Fell In Slot \(randomNumber()), \(gameTime())"
    }
}
//Dependency Injection
class Player {
    private let roll: Rollable
    
    init(roll: Rollable) {
        self.roll = roll
    }
    
    func playerRoll() -> String {
        return roll.Roll()
    }
}
//class Table: SurfaceArea  {
//    var height: Double
//    var width: Double
//    init(height: Double, width: Double) {
//        self.height = height
//        self.width = width
//    }
//    func area() -> Double {
//        return width * height
//        
//    }
//}
//
//
//
//class CatanBoard: SurfaceArea {
//    var height: Double
//    var width: Double
//    init(height: Double, width: Double) {
//        self.height = height
//        self.width = width
//    }
//    func area() -> Double {
//        return width * height
//    }
//}
//
//class CircleBoard: SurfaceArea {
//    var radius: Double
//    
//    init(radius: Double) {
//        self.radius = radius
//    }
//    
//    func area() -> Double {
//        return Double.pi * radius * radius
//    }}






