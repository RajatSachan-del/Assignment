//
//  AssignmentUTests.swift
//  AssignmentUTests
//
//  Created by Apple on 18/11/20.
//

import XCTest
@testable import Assignment

class AssignmentUTests: XCTestCase {

    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
        XCTAssertTrue( 22 > 34, "Assertion fails")
  
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
