//
//  RecursiveAlgorithms.swift
//  DiscreteMathProblems
//
//  Created by Riley Crebs on 5/3/16.
//  Copyright © 2016 Incravo. All rights reserved.
//

import Foundation

extension Int {
    static func fibonacci(b:Int) -> Int {
        if b == 0 || b == 1 {
            return b;
        }
        return fibonacci(b - 1) + fibonacci(b - 2)
    }
}