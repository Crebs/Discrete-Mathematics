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
    
    /**
     Algorithm to check if Prime value.
     @return True if is prime, false otherwise.
     */
    func isPrime() -> Bool {
        var i = 2
        while Double(i) <= sqrt(Double(self)) {
            if self % i == 0 && i.isPrime() {
                return false
            }
            i+=1
        }
        return true
    }
    
    /**
     Uses the inverse of the is prime algorithm
     @return True if is composite number, false otherwise.
    */
    func isComposite() -> Bool {
        return self.isPrime() == false
    }
    
    /**
     Algorithm to find prime factors.
     @return Array of prime factors.
    */
    func primeFactors() -> [Int] {
        var factor = self
        var value = 2
        var factors :Array = Array<Int>()
        while Double(value) < sqrt(Double(self)) {
            if factor % value == 0 {
                // Assert if not prime
                assert(value.isPrime())
                // Insert value into results array
                factors.append(value)
                // Factor out value
                factor /= value
            }
            value+=1
        }
        if factor != 1 {
            factors.append(factor)
        }
        return factors
    }
    
    /**
     Pseudoprimes are composite numbers that hold to the congruence 
     a^(p-1) == 1 (mod p)
    */
    func isPseudoPrimeOfBase(b :Int) -> Bool {
        let isCompoite = self.isComposite()
        if isCompoite {
            for factor in self.primeFactors() {
                if Int(pow(Double(b), Double(factor)-1)).congruentTo(1, mod: factor) == false {
                        return false
                }
            }
        }
        return isCompoite
    }
    
    /**
     A composte positive integer that satififies the congurency 
     b^(n-1) == 1 (mod n) for every base b with  gcd(b, n) = 1
     is called a Carmichael number
     @param b Array of bases to check against
     @return True if a Carmicheal Number, false otherwise
    */
    func isCarmichealNumberOfBases(b :NSArray) -> Bool {
        let isComposite = self.isComposite()
        if isComposite {
            // Check that self is a composite number
            for base in b {
                for factor in self.primeFactors() {
                    if Int(pow(Double(base as! NSNumber), Double(factor)-1)).congruentTo(1, mod: factor) == false
                        && Int(base as! NSNumber).gcd(factor) != 1 {
                            return false
                    }
                }
            }
        }
        return isComposite
    }
    
    /**
     The totient function phi(n), also called Euler's totient function, is 
     defined as the number of positive integers <=n that are relatively prime to
     (i.e., do not contain any factor in common with) n, where 1 is counted as 
     being relatively prime to all numbers.
     @return Array of integers less than n that relativily prime to n. (where is
     the Int self).
    */
    func totatives() -> Array<Int> {
        var i = 0
        var totatives : Array<Int> = Array<Int>()
        while i < self {
            if self.gcd(i) == 1 {
                totatives.append(i)
            }
            ++i;
        }
        return totatives
    }
}

struct Primes {
    /**
     Lucas-Lehmer: https://en.wikipedia.org/wiki/Lucas–Lehmer_primality_test
     Algorithm to test if primality of Mersenne numbers 
     (https://en.wikipedia.org/wiki/Mersenne_prime)
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
    
}