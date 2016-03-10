//
//  RSA.swift
//  DiscreteMathProblems
//
//  Created by Riley Crebs on 3/10/16.
//  Copyright © 2016 Incravo. All rights reserved.
//

import Foundation

extension String {
    /**
     Converts String into an array of base 10 ascii characters.
    */
    func asciiValueOfString() -> [UInt32] {
        var retVal = [UInt32]()
        for val in self.unicodeScalars where val.isASCII() {
            retVal.append(UInt32(val))
        }
        return retVal
    }
}

class RSA {
    /**
     RSA encryption algroithm. Of the mathematical form C = m^e mod n.
     @param m String message to encrypt.
     @param e Int A public key used to encrypt (must be relativly prime to (p-1)(q-1) where n = p*q).
     @param n Int A public key used to encrypt the messeage (where n=p*q).
     @return A encrypted message (cipher text C of the form C = m^e mod n).
    */
    func encrypt(message m:String, key e:Int, mod n:Int) -> [Int] {
        let modArithmetic = ModularArithmetic()
        var encryptedMsg = [Int]()
        for asciiVal in m.asciiValueOfString() {
            encryptedMsg.append(modArithmetic.modularExponentiation(Int(asciiVal), toPower: e, mod: n)) 
        }
        return encryptedMsg
    }
    
    /**
     RSA decryption algorithm. Of the mathematical expression P = C^d mod 2537.
     @param c [Int] An array of encrypted base 10 ascii characters to decrypt back to plain text P.
     @param d Int The private key aquired from the invers of e mod (p-1)(q-1). This is the main element of the decription algorithm.
     @param n Int A public key used to encrypt the messeage (where n=p*q).
     @return A decrypted message from the cipher array (plain text P of the form P = C^d mod n).
     */
    func decrypt(cipher c:[Int], key d:Int, mod n:Int) -> String {
        let modArithmetic = ModularArithmetic()
        var string = String()
        var asciiVal = 0
        for cipherVal in c {
            asciiVal = modArithmetic.modularExponentiation(cipherVal, toPower: d, mod: n)
            string.append(Character(UnicodeScalar(asciiVal)))
        }
        return string
    }
    
    /**
     RSA secret sauce.  This finds the private decription key from the inverse of e mod (p-1)(q-1).
     @param e Int A public key used to encrypt (must be relativly prime to (p-1)(q-1) where n = p*q).
     @param p Int A privately know value to poduce n (where n = p * q).
     @param q Int A privately know value to poduce n (where n = p * q).
     @return d Int A private key used to decript the message encypted (from the form C = m^e mod p*q).
    */
    func decryptionKeyFromEncryptionKey(e:Int, p:Int, q:Int) -> Int {
        return Euclidean().inversOf(e, mod: (p-1)*(q-1))
    }
}