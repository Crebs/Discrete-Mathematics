//
//  ModularArithmeticTests.swift
//  DiscreteMathProblems
//
//  Created by Riley Crebs on 3/8/16.
//  Copyright © 2016 Incravo. All rights reserved.
//

import XCTest

class ModularArithmeticTests: XCTestCase {

    func testCongruentTo_With_4_Congruent_1_mod_3__ShouldReturnTrue() {
        XCTAssertTrue(4.congruentTo(1, mod: 3))
        
    }

    func testCongruentTo_With_4_Congruent_5_mod_9__ShouldReturnFalse() {
        XCTAssertFalse(4.congruentTo(5, mod: 9))
    }
}
