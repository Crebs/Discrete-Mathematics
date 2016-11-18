//
//  RecursiveAlgorithms.swift
//  SwiftScripts
//
//  Created by Riley Crebs on 11/18/16.
//  Copyright © 2016 riley. All rights reserved.
//

import Foundation

extension Int {
    static public prefix func !(n: Int) -> Int {
        if n == 0 {
            return 1
        } else {
            return n * !(n - 1)
        }
    }
}
