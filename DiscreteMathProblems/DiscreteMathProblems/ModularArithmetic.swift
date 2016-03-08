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