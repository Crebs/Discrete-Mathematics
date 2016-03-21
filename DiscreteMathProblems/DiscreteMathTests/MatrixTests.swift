//
//  MatrixTests.swift
//  DiscreteMathProblems
//
//  Created by Riley Crebs on 3/15/16.
//  Copyright © 2016 Incravo. All rights reserved.
//

import XCTest

class MatrixTests: XCTestCase {

    func testMultiplicationOperator_With2by2And2by2Matrix_ShouldReturn2by2Matrix() {
        var matrixA = Matrix(rows: 2, columns: 2)
        matrixA[0,0] = 1
        matrixA[0,1] = 1
        matrixA[1,0] = 2
        matrixA[1,1] = 1
        
        var matrixB = Matrix(rows: 2, columns: 2)
        matrixB[0,0] = 2
        matrixB[0,1] = 1
        matrixB[1,0] = 1
        matrixB[1,1] = 1
        
        
        let matrixC = matrixA * matrixB
        XCTAssertEqual(matrixC.rows, 2)
        XCTAssertEqual(matrixC.columns, 2)
    }
    
    func testMultiplicationOperator_With2by2And2by2Matrix_ShouldReturnValidMatrix() {
        var matrixA = Matrix(rows: 2, columns: 2)
        matrixA[0,0] = 1
        matrixA[0,1] = 1
        matrixA[1,0] = 2
        matrixA[1,1] = 1
        
        var matrixB = Matrix(rows: 2, columns: 2)
        matrixB[0,0] = 2
        matrixB[0,1] = 1
        matrixB[1,0] = 1
        matrixB[1,1] = 1
        
        let matrixC = matrixA * matrixB
        XCTAssertEqual(matrixC[0,0], 3)
        XCTAssertEqual(matrixC[0,1], 2)
        XCTAssertEqual(matrixC[1,0], 5)
        XCTAssertEqual(matrixC[1,1], 3)
    }
    
    func testMultiplicationOperator_With3by3And3by4Matrix_ShouldReturn3by4Matrix() {
        var matrixA = Matrix(rows: 3, columns: 3)
        matrixA[0,0] = 1
        matrixA[0,1] = -3
        matrixA[0,2] = 0
        matrixA[1,0] = 1
        matrixA[1,1] = 2
        matrixA[1,2] = 2
        matrixA[2,0] = 2
        matrixA[2,1] = 1
        matrixA[2,2] = -1
        
        
        var matrixB = Matrix(rows: 3, columns: 4)
        matrixB[0,0] = 1
        matrixB[0,1] = -1
        matrixB[0,2] = 2
        matrixB[0,3] = 3
        matrixB[1,0] = -1
        matrixB[1,1] = 0
        matrixB[1,2] = 3
        matrixB[1,3] = -1
        matrixB[2,0] = -3
        matrixB[2,1] = -2
        matrixB[2,2] = 0
        matrixB[2,3] = 2
        
        let matrixC = matrixA * matrixB
        XCTAssertEqual(matrixC.rows, 3)
        XCTAssertEqual(matrixC.columns, 4)
    }
    func testMultiplicationOperator_With3by3And3by4Matrix_ShouldReturnValidMatrix() {
        var matrixA = Matrix(rows: 3, columns: 3)
        matrixA[0,0] = 1
        matrixA[0,1] = -3
        matrixA[0,2] = 0
        matrixA[1,0] = 1
        matrixA[1,1] = 2
        matrixA[1,2] = 2
        matrixA[2,0] = 2
        matrixA[2,1] = 1
        matrixA[2,2] = -1
        
        
        var matrixB = Matrix(rows: 3, columns: 4)
        matrixB[0,0] = 1
        matrixB[0,1] = -1
        matrixB[0,2] = 2
        matrixB[0,3] = 3
        matrixB[1,0] = -1
        matrixB[1,1] = 0
        matrixB[1,2] = 3
        matrixB[1,3] = -1
        matrixB[2,0] = -3
        matrixB[2,1] = -2
        matrixB[2,2] = 0
        matrixB[2,3] = 2
        
        let matrixC = matrixA * matrixB
        XCTAssertEqual(matrixC[0,0], 4)
        XCTAssertEqual(matrixC[0,1], -1)
        XCTAssertEqual(matrixC[0,2], -7)
        XCTAssertEqual(matrixC[0,3], 6)
        XCTAssertEqual(matrixC[1,0], -7)
        XCTAssertEqual(matrixC[1,1], -5)
        XCTAssertEqual(matrixC[1,2], 8)
        XCTAssertEqual(matrixC[1,3], 5)
        XCTAssertEqual(matrixC[2,0], 4)
        XCTAssertEqual(matrixC[2,1], 0)
        XCTAssertEqual(matrixC[2,2], 7)
        XCTAssertEqual(matrixC[2,3], 3)
    }
    
    func testBooleanProduct_With3by3_ShouldReturnValidMatrix () {
        var matrixA = Matrix(rows: 2, columns: 2)
        matrixA[0,0] = 1
        matrixA[0,1] = 1
        matrixA[1,0] = 0
        matrixA[1,1] = 1
        
        var matrixB = Matrix(rows: 2, columns: 2)
        matrixB[0,0] = 0
        matrixB[0,1] = 1
        matrixB[1,0] = 1
        matrixB[1,1] = 1
        
        
        let matrixC = Matrix.zeroOneProduct(matrixA, right: matrixB)
        XCTAssertEqual(matrixC[0,0], 1)
        XCTAssertEqual(matrixC[0,1], 1)
        XCTAssertEqual(matrixC[1,0], 1)
        XCTAssertEqual(matrixC[1,1], 1)
        
    }

}
