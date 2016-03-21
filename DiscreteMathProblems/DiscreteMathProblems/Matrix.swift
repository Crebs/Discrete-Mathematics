//
//  Matrix.swift
//  DiscreteMathProblems
//
//  Created by Riley Crebs on 3/15/16.
//  Copyright © 2016 Incravo. All rights reserved.
//

import Foundation
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    /**
     */
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    /**
     */
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    /**
    */
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
    // MARK 
    /**
     Algorithm for Zero-one matrix, the boolean product.  See Rosen page 253 
     Section 3.8
     @param left Matrix perform operation on.
     @param right Matrix
     @return Boolean product
    */
    static func zeroOneProduct(left: Matrix, right: Matrix) -> Matrix {
        return Matrix.matrixProduct(left, right: right, procedure: { Double(Int($0) | (Int($1) & Int($2)))})
    }
    
    /**
     Helper method used for looping through matrices to produce product.
     @param left Matrix peform operation on.
     @param right Matrix
     @param Closure to handle procedure.
    */
    static func matrixProduct(left: Matrix, right:Matrix, procedure:(Double, Double, Double) -> Double) -> Matrix {
        var resultMatrix = Matrix(rows: left.rows, columns: right.columns)
        for i in 0...left.rows - 1 {
            for j in 0...right.columns - 1 {
                resultMatrix[i,j] = 0
                for q in 0...left.columns - 1 {
                    resultMatrix[i, j] = procedure(resultMatrix[i,j], left[i,q], right[q,j])
                }
            }
        }
        return resultMatrix
    }
}

/**
 Algorithm for Matrix Multiplication. O(n^3) See Rosen page 249 Section 3.8
 @param left Matrix to left of muliplication operator.
 @param right Matrix to right of muliplication operator.
 @return New matrix from multiplication of left and right matrices.
*/
func * (left: Matrix, right:Matrix) -> Matrix {
    return Matrix.matrixProduct(left, right: right, procedure: {$0 + ($1 * $2)})
}

