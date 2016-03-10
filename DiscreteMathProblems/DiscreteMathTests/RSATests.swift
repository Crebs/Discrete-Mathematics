//
//  RSATests.swift
//  DiscreteMathProblems
//
//  Created by Riley Crebs on 3/10/16.
//  Copyright © 2016 Incravo. All rights reserved.
//

import XCTest

class RSATests: XCTestCase {
    let rsa = RSA()
    
    func testRSAEncryption_WithMessageStop_ShouldReturn18191415() {
        let p = 43
        let q = 59
        let e = 13
        let n = p * q
        let encryptOutput = rsa.encrypt(message: "STOP", key: e, mod: n)
        let decryptionKey = rsa.decryptionKeyFromEncryptionKey(e, p: p, q: q)
        let decryptOutput = rsa.decrypt(cipher:encryptOutput, key:decryptionKey, mod: n)
        XCTAssertEqual(decryptOutput, "STOP")
    }
    
    func testdecryptionKeyFromEncryptionKey_WithE13P43Q58_ShouldReturn937(e:Int, p:Int, q:Int) {
        XCTAssertEqual(rsa.decryptionKeyFromEncryptionKey(13, p: 43, q: 59), 937)
    }
}
