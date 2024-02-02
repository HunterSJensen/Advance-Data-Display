//
//  Fake__Stub__and_Mock_objectssTests.swift
//  Fake, Stub, and Mock objectssTests
//
//  Created by Hunter Jensen on 1/31/24.
//

import XCTest
@testable import Fake__Stub__and_Mock_objectss

final class Fake__Stub__and_Mock_objectssTests: XCTestCase {

    func testCalculator_Addition() {
        let fakeMathOperation = FakeMathOperation()
        let calculator = Calculator(mathOperation: fakeMathOperation)

        XCTAssertEqual(calculator.add(10, 10), 20)
    }

    func testCalculator_Subtraction() {
        let fakeMathOperation = FakeMathOperation()
        let calculator = Calculator(mathOperation: fakeMathOperation)
        
        XCTAssertEqual(calculator.subtract(5, 3), 2)
    }
    
    func testCalculator_Stub_Addition() {
        let stubMathOperation = StubMathOperation()
        let calculator = Calculator(mathOperation: stubMathOperation)

        XCTAssertEqual(calculator.add(100, 3), 10)
    }

    func testCalculator_Stub_Subtraction() {
        let stubMathOperation = StubMathOperation()
        let calculator = Calculator(mathOperation: stubMathOperation)

        XCTAssertEqual(calculator.subtract(200, 1), 5)
    }
    
    func testCalculator_Mock_Addition() {
        let mockMathOperation = MockMathOperation()
        let calculator = Calculator(mathOperation: mockMathOperation)

        _ = calculator.add(2, 3)

        XCTAssertTrue(mockMathOperation.addCalled)
    }

    func testCalculator_Mock_Subtraction() {
        let mockMathOperation = MockMathOperation()
        let calculator = Calculator(mathOperation: mockMathOperation)

        _ = calculator.subtract(5, 3)

        XCTAssertTrue(mockMathOperation.subtractCalled)
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
