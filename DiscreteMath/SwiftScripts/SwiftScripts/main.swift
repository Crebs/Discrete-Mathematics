#!/usr/bin/swift

import Foundation
class KnownPrime {
    private var primes = [Int]()
    private func addToKnowPrimes(newPrime: Int) {
        primes.append(newPrime)
    }
    public func isPrime(number: Int) -> Bool {
        let root = Int(floor(sqrt(Double(number))))
        for nextPrime in primes {
            if nextPrime <= root {
                let remainder = number % nextPrime
                if remainder == 0 {
                    return false
                }
            } else {
                break
            }
            
        }
        return true
    }
    
    public func primesThrough(max: Int) -> [Int] {
        var nuq = 2;
        while nuq <= max {
            if isPrime(number: nuq) {
                addToKnowPrimes(newPrime: nuq)
            }
            nuq += 1
        }
        return primes
    }
}


class PrimeOutput {
    public func primes(max: Int) {
        let knownPrimes = KnownPrime()
        let primes = knownPrimes.primesThrough(max: max)
        var previous :Int?
        for prime in primes {
            print(prime)
            if (previous != nil) {
                let diff = prime - previous! - 1
                if !knownPrimes.isPrime(number: diff) {
                    print("^\(diff) isn't prime !!!!!")
                } else {
                    print("^\(diff)")
                }
                
            }
            previous = prime
        }
    }
}


//// Takes input from commandline
for  argument in CommandLine.arguments {
    if let numberOfPrimes = Int(argument) {
        let output = PrimeOutput()
        output.primes(max: numberOfPrimes)
    }
}


