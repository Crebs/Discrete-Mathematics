//
//  DiscreteMathTests.swift
//  DiscreteMathTests
//
//  Created by Riley Crebs on 3/4/16.
//  Copyright © 2016 Incravo. All rights reserved.
//

import XCTest

class DiscreteMathTests: XCTestCase {
    var euclid: Euclidean?
    override func setUp() {
        euclid = Euclidean()
    }
    func testGCD_WithRelativePrimeNumbersLargerValueFirstParam_ShouldReturnOne() {
        let gcd = euclid!.gcd(300, b: 127)
        XCTAssertEqual(gcd, 1);
    }
    
    func testGCD_WithRelativePrimeNumbersLargerValueSecondParam_ShouldReturnOne() {

        let gcd = euclid!.gcd(127, b: 300)
        XCTAssertEqual(gcd, 1);
    }
    
    func testGCD_WithNonRelativePrimeNumbersLargerValueFirstParam_ShouldNotReturnOne() {
        let gcd = euclid!.gcd(24, b: 16)
        XCTAssertNotEqual(gcd, 1)
        XCTAssertEqual(gcd, 8)
    }
    
    func testGCD_WithNonRelativePrimeNumbersLargerValueSecondParam_ShouldNotReturnOne() {
        let gcd = euclid!.gcd(16, b: 24)
        XCTAssertNotEqual(gcd, 1)
        XCTAssertEqual(gcd, 8)
    }
    
    func testLinearCombination_WithLargerValueAsFirstParam_ShouldReturnValidLinearCombination() {
        let linearCombination = euclid!.linearCombination(903070, b: 99)
        XCTAssertEqual(linearCombination.s, 37);
        XCTAssertEqual(linearCombination.t, -337511);
    }
    
    func testLinearCombination_WithLargerValueAsSecondParam_ShouldReturnValidLinearCombination() {
        let linearCombination = euclid!.linearCombination(99, b: 903070)
        XCTAssertEqual(linearCombination.s, -337511);
        XCTAssertEqual(linearCombination.t, 37);
    }
    
    func testIntExtensionDivMod_WithSevenDivModSevenTeen() {
        let a = 7
        let b = 17
        let divmod = a.divmod(b)
        XCTAssertEqual(divmod.q, 7/17)
        XCTAssertEqual(divmod.r, 7%17)
    }
    
    func testIntExtensionDivMod_WithSevenTeenDivModSeven() {
        let a = 17
        let b = 7
        let divmod = a.divmod(b)
        XCTAssertEqual(divmod.q, 17/7)
        XCTAssertEqual(divmod.r, 17%7)
    }
}
