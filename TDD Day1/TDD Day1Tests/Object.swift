//
//  Object.swift
//  TDD Day1
//
//  Created by Hunter Jensen on 2/1/24.
//

import Foundation

struct Person {
  let name: String
  let age: Int
  let hairColor: String
  var numberOfPets: Int
  var ownCar: Bool
  init(name: String, age: Int, hairColor: String, numberOfPets: Int, hasCar: Bool) {
    self.name = name
    self.age = age
    self.hairColor = hairColor
    self.numberOfPets = numberOfPets
    self.ownCar = hasCar
  }
  mutating func isHouseless() {
    ownCar = false
  }
  mutating func notHouseless() {
    ownCar = true
  }
}
