//
//  TDD_Day1Tests.swift
//  TDD Day1Tests
//
//  Created by Hunter Jensen on 2/1/24.
//

import XCTest
@testable import TDD_Day1

final class TDD_Day1Tests: XCTestCase {

    var testPerson: Person!
      let expectedName = "Cassandra"
      let expectedAge = 48
      let expectedHairColor = "Red"
      let expectedNumberOfPets = 8
      let doesOwnCar = true
      override func setUp() {
          super.setUp()
        testPerson = Person(name: expectedName,
        age: expectedAge,
        hairColor: expectedHairColor,
        numberOfPets: expectedNumberOfPets,
        hasCar: doesOwnCar)
        }
      func testPersonIdentity() {
        XCTAssertEqual(testPerson.name, expectedName)
        XCTAssertEqual(testPerson.age, expectedAge)
        XCTAssertEqual(testPerson.hairColor, expectedHairColor)
      }
      func testPersonPets() {
        XCTAssertLessThanOrEqual(testPerson.numberOfPets, 10)
      }
      func testPersonHouse() {
        XCTAssertTrue(doesOwnCar)
      }
          
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
