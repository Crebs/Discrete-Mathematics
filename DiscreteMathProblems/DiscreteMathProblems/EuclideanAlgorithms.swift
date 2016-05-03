//
//  EuclideanAlgorithms.swift
//  DiscreteMathProblems
//
//  Created by Riley Crebs on 3/4/16.
//  Copyright © 2016 Incravo. All rights reserved.
//

import Foundation
extension Int {
    /**
     Division Algorithm from page 225 of Rosen. The division states that if a
     (self in this case) is an interger and d is a postive integer, then there 
     are unique integers q and r with 0 <= r < d and a = dq + r.
     @param a Integer value representing the dividend of the equation.
     @param b Integer value representing the divisor of the equation.
     @return 2-tuple q as the quotient and r as the remainder.
     */
    func divmod(b :Int) -> (q :Int, r :Int) {
        var q = 0
        var r = abs(self)
        while r >= b {
            r = r - b
            q = q + 1
        }
        if self < 0 && r > 0 {
            r = b - r
            q = -(q + 1)
        }
        return (q, r)
    }
    
    /**
     Euclidean algorithm (name after Euclid, Greek Mathematician from his book
     the Elements) for finding the greatest common divisor of two integers.
     Argude to be one of the most useful algorithms and possibly one of the
     oldest. (For more information see Rosen Section 3.6 start @ pg 226.)
     https://en.wikipedia.org/wiki/Euclid
     @param b Integer value to find gcd
     @return the gcd of the two integers
     */
    func gcd(b :Int) -> Int {
        var result = self
        if b != 0 {
            result = b.gcd(self%b)
        }
        return result
    }
}

struct Euclidean {
    /**
     origianl source from https://gist.github.com/gpfeiffer/4013925
     
     given non-negative integers a and b, compute
     coefficients s and t such that gcd(a, b) == s*a + t*b [aka Bézout's Identity]
     reference: https://en.wikipedia.org/wiki/Bézout%27s_identity
     Finding gcd(a, b) as a linear combination of a and b with coefficients s
     and t. (For more informaitn see Rosen Section 3.6 start @ pg 232.)
     
     Example table for gcd(252, 198) = 18 as a linear combination of 252 and 198
     Stack a  , b  , q, r , s , t , returned tuple (t, s - q * t)
     0     252  198  1  54  -   -   -
     1     198  54   3  36  -   -   -
     2     54   36   1  18  -   -   -
     3     36   18   2  0   -   -   -
     4     18   0    -  -   -   -   (1 , 0)                              18 = 18
     3     36   18   2  0   1   0   (0 , 1 - 2*0 = 1)      => ( 0, 1 )   18 = 36*0   + 18*1
     2     54   36   1  18  0   1   (1 , 0 - 1 * 1 = -1)   => ( 1, -1)   18 = 54*1   + 36*-1
     1     198  54   3  36  1   -1  (-1, 1 - 3*-1 = 4)     => (-1, 4 )   18 = 198*-1 + 54*4
     0     252  198  1  54  -1  4   (4 ,  -1 - 1 * 4 = -5) => ( 4, -5)   18 = 252*4  + 198*-5
     
     { this completes the solution in the form gcd(252, 198) = 18 = 4*252 + -5*198,
     where s is 4 and t is -5 }
     
     @param a Integer value to find linear combination of
     @param b Integer value to find linear combination of
     @return tuple of coefficients s, t for the Bézout's Identity s*a + tb
     */
    func linearCombination(a :Int, b :Int) -> (s: Int, t: Int) {
        if b == 0 {
            return (1, 0)
        }
        let divmod = a.divmod(b)
        let combination = linearCombination(b, b:divmod.r)
        return (combination.t, combination.s - divmod.q * combination.t);
    }
    
    /**
     Uses Extended Euclidean Algorithm (linear combination of a and b) to find an inverse of a mod m.
     @param e Int deviden from the form e == 1 mod n.
     @param n Int divisor from the form e == 1 mod n.
     @return The invers of e mod n.
     */
    func inversOf(e:Int, mod n:Int) -> Int {
        let tuple = self.linearCombination(e, b: n)
        return tuple.s
    }
}