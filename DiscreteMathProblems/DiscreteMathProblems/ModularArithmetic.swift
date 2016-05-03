//
//  ModularArithmetic.swift
//  DiscreteMathProblems
//
//  Created by Riley Crebs on 3/8/16.
//  Copyright © 2016 Incravo. All rights reserved.
//

import Foundation

extension Int {
    /**
     From the mathematical notation a == b (mod m)
     @param b Integer to be modulated by some integer m
     @param m Integer devisor 
     @return True if congruence holds, false otherwise
    */
    func congruentTo(b :Int, mod m :Int) -> Bool {
        return(self - b) % m == 0
    }
}

struct ModularArithmetic {
    /**
     Function to perform Modular Exponentiation from the form b^n mod m (see Rosen)
     @param b Integer representing coefficent
     @param n Integer representing exponent
     @param m Integer representing divisor
     return Integer result of b^n mod m
    */
    func modularExponentiation(b :Int, toPower n :Int, mod m :Int) -> Int {
        let bitstring : Array<Int> = self.base(2, expantionOf: n)
        var x = 1
        var power = b % m
        var i = 0
        while i < bitstring.count {
            if bitstring[i] == 1 {
                x = (x * power) % m
            }
            power = (power * power) % m
            i += 1
        }
        return x
    }
    
    /**
     A recursive Function to obtain then base expanstion of n (when n is a decimal)
     @param base Base value to expand to. Examples: base 2 - binary, base 16 Hexadecimal, base 8 Octal
     @param n Decimal to expand the base to
     @param a An array to fill with the expantions (this will be filled by the recursive call make sure this an empty array)
    */
    func recursiveBase(b:Int, expantionOf n:Int, a:Array<Int>) -> Array<Int> {
        var result = a;
        if n != 0 {
        let q = (n/b)
            result.append(n - (q * b))
            result  = recursiveBase(b, expantionOf: q, a: result)
        } else {
            return result
        }
        return result
    }
    
    /**
     When 'n' is a base 10 number we can find a number of given 'base'
     @param base Base value to expand to. Examples: base 2 - binary, base 16 Hexadecimal, base 8 Octal
     @param n Decimal to expand the base to
     @return Array representing base expanstion in the form (a_0 a_1 .... a_k-1)_base
    */
    func base(b:Int, expantionOf n:Int) -> Array<Int> {
        let bitString :Array<Int> = Array()
        let result = self.recursiveBase(b, expantionOf: n, a: bitString)
        return result
    }
}