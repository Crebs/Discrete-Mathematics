//
//  ModularArithmeticTests.swift
//  DiscreteMathProblems
//
//  Created by Riley Crebs on 3/8/16.
//  Copyright © 2016 Incravo. All rights reserved.
//

import XCTest

class ModularArithmeticTests: XCTestCase {
    let modArithmetic = ModularArithmetic()
    func testCongruentTo_With_4_Congruent_1_mod_3__ShouldReturnTrue() {
        XCTAssertTrue(4.congruentTo(1, mod: 3))
        
    }
    func testCongruentTo_With_4_Congruent_5_mod_9__ShouldReturnFalse() {
        XCTAssertFalse(4.congruentTo(5, mod: 9))
    }
    
    // MARK: Modular Exponentiation Tests
    func testModularExponentiation_With_B_1819_n_13_m_2537_ShouldReturn_2081() {
        XCTAssertEqual(modArithmetic.modularExponentiation(1819, toPower: 13, mod: 2537), 2081)
    }
    func testModularExponentiation_With_B_1415_n_13_m_2537_ShouldReturn_2081() {
        XCTAssertEqual(modArithmetic.modularExponentiation(1415, toPower: 13, mod: 2537), 2182)
    }
    func testModularExponentiation_With_B_5_n_117_m_19_ShouldReturn_1() {
        XCTAssertEqual(modArithmetic.modularExponentiation(5, toPower: 117, mod: 19), 1)
    }
    func testModularExponentiation_With_B_9_n_178_m_36_ShouldReturn_9() {
        XCTAssertEqual(modArithmetic.modularExponentiation(9, toPower: 178, mod: 36), 9)
    }
    func testModularExponentiation_With_b_7_n_27_m_30_ShouldReturn_13() {
        XCTAssertEqual(modArithmetic.modularExponentiation(7, toPower: 27, mod: 30), 13)
    }
    
    func testBaseConversion_With177130_ToBase_16_ShouldReturn2B3EA() {
        let modArithmetic = ModularArithmetic()
        XCTAssertEqual(modArithmetic.base(16, expantionOf: 177130), [10,14,3,11,2])
    }
}
