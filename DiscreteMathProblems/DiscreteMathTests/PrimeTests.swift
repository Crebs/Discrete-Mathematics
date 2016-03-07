//
//  PrimeTests.swift
//  DiscreteMathProblems
//
//  Created by Riley Crebs on 3/7/16.
//  Copyright © 2016 Incravo. All rights reserved.
//

import XCTest

class PrimeTests: XCTestCase {
    func testLucas_LeherPrimality_WithMersennePrimeValue_ShouldReturnTrue() {
        let prime = Primes()
        XCTAssertTrue(prime.lucas_lehmerPrimality(3))
    }
    
    func testLucas_LeherPrimality_WithMersenneNonPrimeValue_ShouldReturnTrue() {
        let prime = Primes()
        XCTAssertFalse(prime.lucas_lehmerPrimality(11))
    }
    
    func testIsPrime_WithPrime_ShouldReturnTrue() {
        let prime = Primes()
        XCTAssertTrue(prime.isPrime(17))
    }
    
    func testIsPrime_With2_ShouldReturnTrue() {
        let prime = Primes()
        XCTAssertTrue(prime.isPrime(2))
    }
    func testIsPrime_With3_ShouldReturnTrue() {
        let prime = Primes()
        XCTAssertTrue(prime.isPrime(3))
    }
    func testIsPrime_With5_ShouldReturnTrue() {
        let prime = Primes()
        XCTAssertTrue(prime.isPrime(5))
    }
    
    func testIsPrime_With20_ShouldReturnFalse() {
        let prime = Primes()
        XCTAssertFalse(prime.isPrime(20))
    }
    
    func testIsPrime_With21_ShouldReturnFalse() {
        let prime = Primes()
        XCTAssertFalse(prime.isPrime(21))
    }
    
}
