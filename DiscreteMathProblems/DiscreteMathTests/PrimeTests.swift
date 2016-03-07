//
//  PrimeTests.swift
//  DiscreteMathProblems
//
//  Created by Riley Crebs on 3/7/16.
//  Copyright © 2016 Incravo. All rights reserved.
//

import XCTest

class PrimeTests: XCTestCase {
    struct Prime {
        static let N = 5000
    }
    var prime :Primes?
    override func setUp() {
        self.prime = Primes()
    }
    
    // MARK:  Lucus-Leher Primality Tests
    func testLucas_LeherPrimality_WithMersennePrimeValue_ShouldReturnTrue() {
        XCTAssertTrue(prime!.lucas_lehmerPrimality(3))
    }
    func testLucas_LeherPrimality_WithMersenneNonPrimeValue_ShouldReturnTrue() {
        XCTAssertFalse(prime!.lucas_lehmerPrimality(11))
    }
    
    // MARK: Primality Tests
    func testIsPrime_WithValuesUpToN() {
        var isPrime :String = "YES"
        for number in 2...Prime.N {
            isPrime = number.isPrime() ? "YES" : "NO"
            print("\(number) is \(isPrime)")
        }
    }
    
    func testIsPrime_WithPrime_ShouldReturnTrue() {
        XCTAssertTrue(17.isPrime())
    }
    func testIsPrime_With2_ShouldReturnTrue() {
        XCTAssertTrue(2.isPrime())
    }
    func testIsPrime_With3_ShouldReturnTrue() {
        XCTAssertTrue(3.isPrime())
    }
    func testIsPrime_With5_ShouldReturnTrue() {
        XCTAssertTrue(5.isPrime())
    }
    
    func testIsPrime_With4_ShouldReturnFalse() {
        XCTAssertFalse(4.isPrime())
    }
    func testIsPrime_With20_ShouldReturnFalse() {
        XCTAssertFalse(20.isPrime())
    }
    func testIsPrime_With21_ShouldReturnFalse() {
        XCTAssertFalse(21.isPrime())
    }
    func testIsPrime_With561_ShouldReturnFalse() {
        XCTAssertFalse(561.isPrime())
    }
    
    // MARK: Prime Factorization Tests
    func testPrimeFactorization_With15_ShouldReturnPrimeFactors3_5() {
        let primeFactors = 15.primeFactors()
        XCTAssertGreaterThanOrEqual(primeFactors.count, 2)
        XCTAssertEqual(primeFactors[0], 3)
        XCTAssertEqual(primeFactors[1], 5)
    }
    func testPrimeFactorization_With561_ShouldReturnPrimeFactors_3_11_17() {
        let primeFactors = 561.primeFactors()
        XCTAssertEqual(primeFactors.count, 3)
        XCTAssertEqual(primeFactors[0], 3)
        XCTAssertEqual(primeFactors[1], 11)
        XCTAssertEqual(primeFactors[2], 17)
        
    }
    
    func testPrimeFactorization_With17_ShouldReturnPrimeFactor17_Only() {
        let primeFactors = 17.primeFactors()
        XCTAssertGreaterThanOrEqual(primeFactors.count, 1)
        XCTAssertTrue(primeFactors[0].isPrime())
    }
    
    
}
