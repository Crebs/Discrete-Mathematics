//
//  RecursiveAlgorithmTests.swift
//  DiscreteMathProblems
//
//  Created by Riley Crebs on 5/3/16.
//  Copyright © 2016 Incravo. All rights reserved.
//

import XCTest

class RecursiveAlgorithmTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFibinacci() {
        XCTAssertEqual(0, Int.fibonacci(0))
        XCTAssertEqual(1, Int.fibonacci(1))
        XCTAssertEqual(1, Int.fibonacci(2))
        XCTAssertEqual(2, Int.fibonacci(3))
        XCTAssertEqual(3, Int.fibonacci(4))
        XCTAssertEqual(5, Int.fibonacci(5))
        XCTAssertEqual(8, Int.fibonacci(6))
        XCTAssertEqual(13, Int.fibonacci(7))
        XCTAssertEqual(21, Int.fibonacci(8))
        
        var a = 0
        var b = 1
        var i = 2
        while i <= 20 {
            a = Int.fibonacci(i)
            b = Int.fibonacci(i + 1)
            XCTAssertEqual(a + b, Int.fibonacci(i + 2))
            i += 1
            
        }
        
    }

}
