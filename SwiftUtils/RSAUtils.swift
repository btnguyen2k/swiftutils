//
//  RsaUtils.swift
//  SwiftUtils
//
//  Created by Thanh Nguyen on 9/16/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//----------------------------------------------------------------------
//  RSA utilities.
//  Credits:
//  - https://github.com/ideawu/Objective-C-RSA
//  - http://netsplit.com/swift-storing-key-pairs-in-the-keyring
//  - http://netsplit.com/swift-generating-keys-and-encrypting-and-decrypting-text
//  - http://hg.mozilla.org/services/fx-home/file/tip/Sources/NetworkAndStorage/CryptoUtils.m#l1036
//----------------------------------------------------------------------

import Foundation
import Security

public class RSAUtils {

    private static let PADDING_FOR_DECRYPT = SecPadding()

    @available(iOS, introduced: 1.2.0)
    public class RSAUtilsError: NSError {
        init(_ message: String) {
            super.init(domain: "com.github.btnguyen2k.SwiftUtils.RSAUtils", code: 500, userInfo: [
                NSLocalizedDescriptionKey: message
            ])
        }

        @available(*, unavailable)
        required public init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    // Base64 encode a block of data
    @available(iOS, introduced: 1.2.0)
    private static func base64Encode(_ data: Data) -> String {
        return data.base64EncodedString(options: [])
    }

    // Base64 decode a base64-ed string
    @available(iOS, introduced: 1.2.0)
    private static func base64Decode(_ strBase64: String) -> Data {
        let data = Data(base64Encoded: strBase64, options: [])
        return data!
    }

    /**
     * Deletes an existing RSA key specified by a tag from keychain.
     *
     * - Parameter tagName: tag name to query for RSA key from keychain
     */
    @available(iOS, introduced: 1.2.0)
    public static func deleteRSAKeyFromKeychain(_ tagName: String) {
        let queryFilter: [String: AnyObject] = [
            String(kSecClass)             : kSecClassKey,
            String(kSecAttrKeyType)       : kSecAttrKeyTypeRSA,
            String(kSecAttrApplicationTag): tagName as AnyObject
        ]
        SecItemDelete(queryFilter as CFDictionary)
    }

    /**
     * Gets an existing RSA key specified by a tag from keychain.
     *
     * - Parameter tagName: tag name to query for RSA key from keychain
     *
     * - Returns: SecKey reference to the RSA key
     */
    @available(iOS, introduced: 1.2.0)
    public static func getRSAKeyFromKeychain(_ tagName: String) -> SecKey? {
        let queryFilter: [String: AnyObject] = [
            String(kSecClass)             : kSecClassKey,
            String(kSecAttrKeyType)       : kSecAttrKeyTypeRSA,
            String(kSecAttrApplicationTag): tagName as AnyObject,
            //String(kSecAttrAccessible)    : kSecAttrAccessibleWhenUnlocked,
            String(kSecReturnRef)         : true as AnyObject
        ]

        var keyPtr: AnyObject?
        let result = SecItemCopyMatching(queryFilter as CFDictionary, &keyPtr)
        if ( result != noErr || keyPtr == nil ) {
            return nil
        }
        return keyPtr as! SecKey?
    }

    /**
     * Adds a RSA private key (PKCS#1 or PKCS#8) to keychain and returns its SecKey reference.
     *
     * On disk, a PEM RSA PKCS#8 private key file starts with string "-----BEGIN PRIVATE KEY-----", and ends with string "-----END PRIVATE KEY-----"; PKCS#1 private key file starts with string "-----BEGIN RSA PRIVATE KEY-----", and ends with string "-----END RSA PRIVATE KEY-----".
     *
     * - Parameter privkeyBase64: RSA private key (PKCS#1 or PKCS#8) in base64
     * - Parameter tagName: tag name to store RSA key to keychain
     *
     * - Throws: `RSAUtilsError` if the input key is not a valid PKCS#8 private key
     *
     * - Returns: SecKey reference to the RSA private key.
     */
    @available(iOS, introduced: 1.2.0)
    @discardableResult public static func addRSAPrivateKey(_ privkeyBase64: String, tagName: String) throws -> SecKey? {
        let fullRange = NSRange(location: 0, length: privkeyBase64.lengthOfBytes(using: .utf8))
        let regExp = try! NSRegularExpression(pattern: "(-----BEGIN.*?-----)|(-----END.*?-----)|\\s+", options: [])
        let myPrivkeyBase64 = regExp.stringByReplacingMatches(in: privkeyBase64, options: [], range: fullRange, withTemplate: "")
        return try addRSAPrivateKey(base64Decode(myPrivkeyBase64), tagName: tagName)
    }

    /**
     * Adds a RSA private key to keychain and returns its SecKey reference.
     *
     * - Parameter privkey: RSA private key (PKCS#1 or PKCS#8)
     * - Parameter tagName: tag name to store RSA key to keychain
     *
     * - Throws: `RSAUtilsError` if the input key is not a valid PKCS#8 private key
     *
     * - Returns: SecKey reference to the RSA private key.
     */
    @available(iOS, introduced: 1.2.0)
    @discardableResult private static func addRSAPrivateKey(_ privkey: Data, tagName: String) throws -> SecKey? {
        // Delete any old lingering key with the same tag
        deleteRSAKeyFromKeychain(tagName)

        let privkeyData = try stripPrivateKeyHeader(privkey)
        if ( privkeyData == nil ) {
            return nil
        }

        // Add persistent version of the key to system keychain
        let queryFilter: [String : Any] = [
            (kSecClass as String)              : kSecClassKey,
            (kSecAttrKeyType as String)        : kSecAttrKeyTypeRSA,
            (kSecAttrApplicationTag as String) : tagName,
            //(kSecAttrAccessible as String)     : kSecAttrAccessibleWhenUnlocked,
            (kSecValueData as String)          : privkeyData!,
            (kSecAttrKeyClass as String)       : kSecAttrKeyClassPrivate,
            (kSecReturnPersistentRef as String): true
            ] as [String : Any]
        let result = SecItemAdd(queryFilter as CFDictionary, nil)
        if ((result != noErr) && (result != errSecDuplicateItem)) {
            NSLog("Cannot add key to keychain, status \(result).")
            return nil
        }

        return getRSAKeyFromKeychain(tagName)
    }

    /**
     * Verifies that the supplied key is in fact a PEM RSA private key, and strips its header.
     *
     * If the supplied key is PKCS#8, its ASN.1 header should be stripped. Otherwise (PKCS#1), the whole key data is left intact.
     *
     * On disk, a PEM RSA PKCS#8 private key file starts with string "-----BEGIN PRIVATE KEY-----", and ends with string "-----END PRIVATE KEY-----"; PKCS#1 private key file starts with string "-----BEGIN RSA PRIVATE KEY-----", and ends with string "-----END RSA PRIVATE KEY-----".
     *
     * - Parameter privkey: RSA private key (PKCS#1 or PKCS#8)
     *
     * - Throws: `RSAUtilsError` if the input key is not a valid RSA PKCS#8 private key
     *
     * - Returns: the RSA private key with header stripped.
     */
    @available(iOS, introduced: 1.2.0)
    private static func stripPrivateKeyHeader(_ privkey: Data) throws -> Data? {
        if ( privkey.count == 0 ) {
            return nil
        }

        var keyAsArray = [UInt8](repeating: 0, count: privkey.count / MemoryLayout<UInt8>.size)
        (privkey as NSData).getBytes(&keyAsArray, length: privkey.count)

        //PKCS#8: magic byte at offset 22, check if it's actually ASN.1
        var idx = 22
        if ( keyAsArray[idx] != 0x04 ) {
            return privkey
        }
        idx += 1

        //now we need to find out how long the key is, so we can extract the correct hunk
        //of bytes from the buffer.
        var len = Int(keyAsArray[idx])
        idx += 1
        let det = len & 0x80 //check if the high bit set
        if (det == 0) {
            //no? then the length of the key is a number that fits in one byte, (< 128)
            len = len & 0x7f
        } else {
            //otherwise, the length of the key is a number that doesn't fit in one byte (> 127)
            var byteCount = Int(len & 0x7f)
            if (byteCount + idx > privkey.count) {
                return nil
            }
            //so we need to snip off byteCount bytes from the front, and reverse their order
            var accum: UInt = 0
            var idx2 = idx
            idx += byteCount
            while (byteCount > 0) {
                //after each byte, we shove it over, accumulating the value into accum
                accum = (accum << 8) + UInt(keyAsArray[idx2])
                idx2 += 1
                byteCount -= 1
            }
            // now we have read all the bytes of the key length, and converted them to a number,
            // which is the number of bytes in the actual key.  we use this below to extract the
            // key bytes and operate on them
            len = Int(accum)
        }
        return privkey.subdata(in: idx..<idx+len)
        //return privkey.subdata(in: NSMakeRange(idx, len).toRange()!)
    }

    /**
     * Adds a RSA public key to keychain and returns its SecKey reference.
     *
     * - Parameter pubkeyBase64: X509 public key in base64 (data between "-----BEGIN PUBLIC KEY-----" and "-----END PUBLIC KEY-----")
     * - Parameter tagName: tag name to store RSA key to keychain
     *
     * - Throws: `RSAUtilsError` if the input key is indeed not a X509 public key
     *
     * - Returns: SecKey reference to the RSA public key.
     */
    @available(iOS, introduced: 1.2.0)
    public static func addRSAPublicKey(_ pubkeyBase64: String, tagName: String) throws -> SecKey? {
        let fullRange = NSRange(location: 0, length: pubkeyBase64.lengthOfBytes(using: .utf8))
        let regExp = try! NSRegularExpression(pattern: "(-----BEGIN.*?-----)|(-----END.*?-----)|\\s+", options: [])
        let myPubkeyBase64 = regExp.stringByReplacingMatches(in: pubkeyBase64, options: [], range: fullRange, withTemplate: "")
        return try addRSAPublicKey(base64Decode(myPubkeyBase64), tagName: tagName)
    }

    /**
     * Adds a RSA pubic key to keychain and returns its SecKey reference.
     *
     * - Parameter pubkey: X509 public key
     * - Parameter tagName: tag name to store RSA key to keychain
     *
     * - Throws: `RSAUtilsError` if the input key is not a valid X509 public key
     *
     * - Returns: SecKey reference to the RSA public key.
     */
    @available(iOS, introduced: 1.2.0)
    private static func addRSAPublicKey(_ pubkey: Data, tagName: String) throws -> SecKey? {
        // Delete any old lingering key with the same tag
        deleteRSAKeyFromKeychain(tagName)

        let pubkeyData = try stripPublicKeyHeader(pubkey)
        if ( pubkeyData == nil ) {
            return nil
        }

        // Add persistent version of the key to system keychain
        //var prt1: Unmanaged<AnyObject>?
        let queryFilter: [String : Any] = [
            (kSecClass as String)              : kSecClassKey,
            (kSecAttrKeyType as String)        : kSecAttrKeyTypeRSA,
            (kSecAttrApplicationTag as String) : tagName,
            (kSecValueData as String)          : pubkeyData!,
            (kSecAttrKeyClass as String)       : kSecAttrKeyClassPublic,
            (kSecReturnPersistentRef as String): true
            ] as [String : Any]
        let result = SecItemAdd(queryFilter as CFDictionary, nil)
        if ((result != noErr) && (result != errSecDuplicateItem)) {
            return nil
        }

        return getRSAKeyFromKeychain(tagName)
    }

    /**
     * Verifies that the supplied key is in fact a X509 public key, and strips its header.
     *
     * On disk, a X509 public key file starts with string "-----BEGIN PUBLIC KEY-----", and ends with string "-----END PUBLIC KEY-----"
     *
     * - Parameter pubkey: X509 public key
     *
     * - Throws: `RSAUtilsError` if the input key is not a valid X509 public key
     *
     * - Returns: the RSA public key with header stripped.
     */
    @available(iOS, introduced: 1.2.0)
    private static func stripPublicKeyHeader(_ pubkey: Data) throws -> Data? {
        if ( pubkey.count == 0 ) {
            return nil
        }

        var keyAsArray = [UInt8](repeating: 0, count: pubkey.count / MemoryLayout<UInt8>.size)
        (pubkey as NSData).getBytes(&keyAsArray, length: pubkey.count)

        var idx = 0
        if (keyAsArray[idx] != 0x30) {
            throw RSAUtilsError("Provided key doesn't have a valid ASN.1 structure (first byte should be 0x30).")
            //return nil
        }
        idx += 1

        if (keyAsArray[idx] > 0x80) {
            idx += Int(keyAsArray[idx]) - 0x80 + 1
        } else {
            idx += 1
        }

        /*
         * If current byte is 0x02, it means the key doesn't have a X509 header (it contains only modulo & public exponent). In this case, we can just return the provided DER data as is
         */
        if (Int(keyAsArray[idx]) == 0x02) {
            return pubkey
        }

        let seqiod = [UInt8](arrayLiteral: 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x01, 0x05, 0x00)
        for i in idx..<idx+seqiod.count {
            if ( keyAsArray[i] != seqiod[i-idx] ) {
                throw RSAUtilsError("Provided key doesn't have a valid X509 header.")
                //return nil
            }
        }
        idx += seqiod.count

        if (keyAsArray[idx] != 0x03) {
            throw RSAUtilsError("Invalid byte at index \(idx) (\(keyAsArray[idx])) for public key header.")
            //return nil
        }
        idx += 1

        if (keyAsArray[idx] > 0x80) {
            idx += Int(keyAsArray[idx]) - 0x80 + 1;
        } else {
            idx += 1
        }

        if (keyAsArray[idx] != 0x00) {
            throw RSAUtilsError("Invalid byte at index \(idx) (\(keyAsArray[idx])) for public key header.")
            //return nil
        }
        idx += 1
        return pubkey.subdata(in: idx..<keyAsArray.count)
        //return pubkey.subdata(in: NSMakeRange(idx, keyAsArray.count - idx).toRange()!)
    }

    /**
     * Encrypts data with a RSA key.
     *
     * - Parameter data: the data to be encrypted
     * - Parameter rsaKeyRef: the RSA key
     * - Parameter padding: padding used for encryption
     *
     * - Returns: the data in encrypted form
     */
    @available(iOS, introduced: 1.2.0)
    public static func encryptWithRSAKey(_ data: Data, rsaKeyRef: SecKey, padding: SecPadding) -> Data? {
        let blockSize = SecKeyGetBlockSize(rsaKeyRef)
        let dataSize = data.count / MemoryLayout<UInt8>.size
        let maxChunkSize = padding==SecPadding.OAEP ? (blockSize - 42) : (blockSize - 11)

        var dataAsArray = [UInt8](repeating: 0, count: dataSize)
        (data as NSData).getBytes(&dataAsArray, length: dataSize)

        var encryptedData = [UInt8](repeating: 0, count: 0)
        var idx = 0
        while (idx < dataAsArray.count ) {
            var idxEnd = idx + maxChunkSize
            if ( idxEnd > dataAsArray.count ) {
                idxEnd = dataAsArray.count
            }
            var chunkData = [UInt8](repeating: 0, count: maxChunkSize)
            for i in idx..<idxEnd {
                chunkData[i-idx] = dataAsArray[i]
            }

            var encryptedDataBuffer = [UInt8](repeating: 0, count: blockSize)
            var encryptedDataLength = blockSize

            let status = SecKeyEncrypt(rsaKeyRef, padding, chunkData, idxEnd-idx, &encryptedDataBuffer, &encryptedDataLength)
            if ( status != noErr ) {
                NSLog("Error while encrypting: %i", status)
                return nil
            }
            encryptedData += encryptedDataBuffer

            idx += maxChunkSize
        }

        return Data(bytes: UnsafePointer<UInt8>(encryptedData), count: encryptedData.count)
    }

    /**
     * Decrypts data with a RSA key.
     *
     * - Parameter encryptedData: the data to be decrypted
     * - Parameter rsaKeyRef: the RSA key
     * - Parameter padding: padding used for decryption
     *
     * - Returns: the decrypted data
     */
    @available(iOS, introduced: 1.2.0)
    public static func decryptWithRSAKey(_ encryptedData: Data, rsaKeyRef: SecKey, padding: SecPadding) -> Data? {
        let blockSize = SecKeyGetBlockSize(rsaKeyRef)
        let dataSize = encryptedData.count / MemoryLayout<UInt8>.size

        var encryptedDataAsArray = [UInt8](repeating: 0, count: dataSize)
        (encryptedData as NSData).getBytes(&encryptedDataAsArray, length: dataSize)

        var decryptedData = [UInt8](repeating: 0, count: 0)
        var idx = 0
        while (idx < encryptedDataAsArray.count ) {
            var idxEnd = idx + blockSize
            if ( idxEnd > encryptedDataAsArray.count ) {
                idxEnd = encryptedDataAsArray.count
            }
            var chunkData = [UInt8](repeating: 0, count: blockSize)
            for i in idx..<idxEnd {
                chunkData[i-idx] = encryptedDataAsArray[i]
            }

            var decryptedDataBuffer = [UInt8](repeating: 0, count: blockSize)
            var decryptedDataLength = blockSize

            let status = SecKeyDecrypt(rsaKeyRef, padding, chunkData, idxEnd-idx, &decryptedDataBuffer, &decryptedDataLength)
            if ( status != noErr ) {
                return nil
            }
            let finalData = removePadding(decryptedDataBuffer)
            decryptedData += finalData

            idx += blockSize
        }

        return Data(bytes: UnsafePointer<UInt8>(decryptedData), count: decryptedData.count)
    }

    @available(iOS, introduced: 1.2.0)
    private static func removePadding(_ data: [UInt8]) -> [UInt8] {
        var idxFirstZero = -1
        var idxNextZero = data.count
        for i in 0..<data.count {
            if ( data[i] == 0 ) {
                if ( idxFirstZero < 0 ) {
                    idxFirstZero = i
                } else {
                    idxNextZero = i
                    break
                }
            }
        }
        if ( idxNextZero-idxFirstZero-1 == 0 ) {
            idxNextZero = idxFirstZero
            idxFirstZero = -1
        }
        var newData = [UInt8](repeating: 0, count: idxNextZero-idxFirstZero-1)
        for i in idxFirstZero+1..<idxNextZero {
            newData[i-idxFirstZero-1] = data[i]
        }
        return newData
    }

    /**
     * Encrypts data using a RSA key from keychain specified by `tagName`.
     *
     * Note: The RSA key must be added to keychain by calling `addRSAPublicKey()` or `addRSAPrivateKey()` period to calling this function.
     *
     * - Parameter data: data to be encrypted
     * - Parameter tagName: tag name to query for RSA key from keychain.
     *
     * - Returns: the data in encrypted form
     */
    @available(iOS, introduced: 1.2.0)
    public static func encryptWithRSAKey(data: Data, tagName: String) -> Data? {
        let keyRef = getRSAKeyFromKeychain(tagName)
        if ( keyRef == nil ) {
            return nil
        }

        return encryptWithRSAKey(data, rsaKeyRef: keyRef!, padding: SecPadding.PKCS1)
    }

    /**
     * Encrypts a string using a RSA key from keychain specified by `tagName`.
     *
     * Note: The RSA key must be added to keychain by calling `addRSAPublicKey()` or `addRSAPrivateKey()` period to calling this function.
     *
     * - Parameter str: string to be encrypted
     * - Parameter tagName: tag name to query for RSA key from keychain.
     *
     * - Returns: the data in encrypted form
     */
    @available(iOS, introduced: 1.2.0)
    public static func encryptWithRSAKey(str: String, tagName: String) -> Data? {
        let keyRef = getRSAKeyFromKeychain(tagName)
        if ( keyRef == nil ) {
            return nil
        }

        return encryptWithRSAKey(str.data(using: .utf8)!, rsaKeyRef: keyRef!, padding: SecPadding.PKCS1)
    }

    /**
     * Decrypts an encrypted data using a RSA key from keychain specified by `tagName`.
     *
     * Note: The RSA key must be added to keychain by calling `addRSAPublicKey()` or `addRSAPrivateKey()` period to calling this function.
     *
     * - Parameter encryptedData: data to be decrypted
     * - Parameter tagName: tag name to query for RSA key from keychain.
     *
     * - Returns: the decrypted data
     */
    @available(iOS, introduced: 1.2.0)
    public static func decryptWithRSAKey(encryptedData: Data, tagName: String) -> Data? {
        let keyRef = getRSAKeyFromKeychain(tagName)
        if ( keyRef == nil ) {
            return nil
        }

        return decryptWithRSAKey(encryptedData, rsaKeyRef: keyRef!, padding: PADDING_FOR_DECRYPT)
    }

    /*----------------------------------------------------------------------*/

    /**
     * Encrypts data using RSA public key.
     *
     * Note: the public key will be stored in keychain with tag as `pubkeyBase64.hashValue`.
     *
     * - Parameter data: data to be encrypted
     * - Parameter pubkeyBase64: X509 public key in base64 (data between "-----BEGIN PUBLIC KEY-----" and "-----END PUBLIC KEY-----")
     *
     * - Throws: `RSAUtilsError` if the supplied key is not a valid X509 public key
     *
     * - Returns: the data in encrypted form
     */
    @available(iOS, introduced: 1.2.0)
    public static func encryptWithRSAPublicKey(data: Data, pubkeyBase64: String) throws -> Data? {
        let tagName = "PUBIC-" + String(pubkeyBase64.hashValue)
        var keyRef = getRSAKeyFromKeychain(tagName)
        if ( keyRef == nil ) {
            keyRef = try addRSAPublicKey(pubkeyBase64, tagName: tagName)
        }
        if ( keyRef == nil ) {
            return nil
        }

        return encryptWithRSAKey(data, rsaKeyRef: keyRef!, padding: SecPadding.PKCS1)
    }

    /**
     * Encrypts a string using RSA public key.
     *
     * Note: the public key will be stored in keychain with tag as `pubkeyBase64.hashValue`.
     *
     * - Parameter str: string to be encrypted
     * - Parameter pubkeyBase64: X509 public key in base64 (data between "-----BEGIN PUBLIC KEY-----" and "-----END PUBLIC KEY-----")
     *
     * - Throws: `RSAUtilsError` if the supplied key is not a valid X509 public key
     *
     * - Returns: the data in encrypted form
     */
    @available(iOS, introduced: 1.2.0)
    public static func encryptWithRSAPublicKey(str: String, pubkeyBase64: String) throws -> Data? {
        let tagName = "PUBIC-" + String(pubkeyBase64.hashValue)
        var keyRef = getRSAKeyFromKeychain(tagName)
        if ( keyRef == nil ) {
            keyRef = try addRSAPublicKey(pubkeyBase64, tagName: tagName)
        }
        if ( keyRef == nil ) {
            return nil
        }

        return encryptWithRSAKey(str.data(using: .utf8)!, rsaKeyRef: keyRef!, padding: SecPadding.PKCS1)
    }

    /**
     * Encrypts data using RSA public key.
     *
     * Note: the public key will be stored in keychain specified by tagName.
     *
     * - Parameter data: data to be encrypted
     * - Parameter pubkeyBase64: X509 public key in base64 (data between "-----BEGIN PUBLIC KEY-----" and "-----END PUBLIC KEY-----")
     * - Parameter tagName: tag name to store RSA key to keychain
     *
     * - Throws: `RSAUtilsError` if the supplied key is not a valid X509 public key
     *
     * - Returns: the data in encrypted form
     */
    @available(iOS, introduced: 1.2.0)
    public static func encryptWithRSAPublicKey(data: Data, pubkeyBase64: String, tagName: String) throws -> Data? {
        var keyRef = getRSAKeyFromKeychain(tagName)
        if ( keyRef == nil ) {
            keyRef = try addRSAPublicKey(pubkeyBase64, tagName: tagName)
        }
        if ( keyRef == nil ) {
            return nil
        }

        return encryptWithRSAKey(data, rsaKeyRef: keyRef!, padding: SecPadding.PKCS1)
    }

    /**
     * Encrypts a string using RSA public key.
     *
     * Note: the public key will be stored in keychain specified by tagName.
     *
     * - Parameter str: string to be encrypted
     * - Parameter pubkeyBase64: X509 public key in base64 (data between "-----BEGIN PUBLIC KEY-----" and "-----END PUBLIC KEY-----")
     * - Parameter tagName: tag name to store RSA key to keychain
     *
     * - Throws: `RSAUtilsError` if the supplied key is not a valid X509 public key
     *
     * - Returns: the data in encrypted form
     */
    @available(iOS, introduced: 1.2.0)
    public static func encryptWithRSAPublicKey(str: String, pubkeyBase64: String, tagName: String) throws -> Data? {
        var keyRef = getRSAKeyFromKeychain(tagName)
        if ( keyRef == nil ) {
            keyRef = try addRSAPublicKey(pubkeyBase64, tagName: tagName)
        }
        if ( keyRef == nil ) {
            return nil
        }

        return encryptWithRSAKey(str.data(using: .utf8)!, rsaKeyRef: keyRef!, padding: SecPadding.PKCS1)
    }

    /*----------------------------------------------------------------------*/

    /**
     * Decrypts an encrypted data using a RSA private key.
     *
     * Note: the private key will be stored in keychain with tag as `privkeyBase64.hashValue`.
     *
     * - Parameter encryptedData: data to be decrypted
     * - Parameter privkeyBase64: RSA PKCS#8 private key in base64 (data between "-----BEGIN PRIVATE KEY-----" and "-----END PRIVATE KEY-----")
     *
     * - Throws: `RSAUtilsError` if the supplied key is not a valid RSA PKCS#8 private key
     *
     * - Returns: the decrypted data
     */
    @available(iOS, introduced: 1.2.0)
    public static func decryptWithRSAPrivateKey(encryptedData: Data, privkeyBase64: String) throws -> Data? {
        let tagName = "PRIVATE-" + String(privkeyBase64.hashValue)
        var keyRef = getRSAKeyFromKeychain(tagName)
        if ( keyRef == nil ) {
            keyRef = try addRSAPrivateKey(privkeyBase64, tagName: tagName)
        }
        if ( keyRef == nil ) {
            return nil
        }

        return decryptWithRSAKey(encryptedData, rsaKeyRef: keyRef!, padding: PADDING_FOR_DECRYPT)
    }

    /**
     * Decrypts an encrypted data using a RSA private key.
     *
     * Note: the private key will be stored in keychain specified by tagName.
     *
     * - Parameter encryptedData: data to be decrypted
     * - Parameter privkeyBase64: RSA PKCS#8 private key in base64 (data between "-----BEGIN PRIVATE KEY-----" and "-----END PRIVATE KEY-----")
     * - Parameter tagName: tag name to store RSA key to keychain
     *
     * - Throws: `RSAUtilsError` if the supplied key is not a valid RSA PKCS#8 private key
     *
     * - Returns: the data in encrypted form
     */
    @available(iOS, introduced: 1.2.0)
    public static func decryptWithRSAPrivateKey(encryptedData: Data, privkeyBase64: String, tagName: String) throws -> Data? {
        var keyRef = getRSAKeyFromKeychain(tagName)
        if ( keyRef == nil ) {
            keyRef = try addRSAPrivateKey(privkeyBase64, tagName: tagName)
        }
        if ( keyRef == nil ) {
            return nil
        }

        return decryptWithRSAKey(encryptedData, rsaKeyRef: keyRef!, padding: SecPadding.OAEP)
    }
}
