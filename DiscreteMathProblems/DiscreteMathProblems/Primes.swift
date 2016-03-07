//
//  Primes.swift
//  DiscreteMathProblems
//
//  Created by Riley Crebs on 3/7/16.
//  Copyright © 2016 Incravo. All rights reserved.
//

import Foundation
extension Int {
    /**
     Mersenne Prime https://en.wikipedia.org/wiki/Mersenne_prime
     @param p Int that representing a prime number
     @return Mersenne Prime 2^p - 1
    */
    static func mersennePrime(p :Int) -> Int {
        return (2 << (p - 1)) - 1
    }
}

struct Primes {
    /**
     Lucas-Lehmer: https://en.wikipedia.org/wiki/Lucas–Lehmer_primality_test
     Algorithm to test if primality of Mersenne numbers (https://en.wikipedia.org/wiki/Mersenne_prime)
     @param p Int that representing a prime number
     @return True if Mersenne Prime is prime, false otherwise
    */
    func lucas_lehmerPrimality(p :Int) -> Bool {
        var s = 4
        // Mersenne Prime, where p is prime 2^p - 1
        let M = Int.mersennePrime(p)
        for _ in 0...p-3 {
            s = ((s * s) - 2) % M
        }
        return s == 0
    }
    
    /**
     Algorithm to check if Prime value
     @param n Int number to check for primality.
     @return True if is prime, false otherwise.
    */
    func isPrime(n :Int) -> Bool {
        var i = 2
        while Double(i) < sqrt(Double(n)) {
            if n % i == 0 && isPrime(i) {
                return false
            }
            i+=1
        }
        return true
    }
}