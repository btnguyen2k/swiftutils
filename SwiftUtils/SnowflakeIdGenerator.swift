//
//  SnowflakeIdGenerator.swift
//  SwiftUtils
//
//  Created by Thanh Nguyen on 8/14/16.
//  Copyright © 2016 Thanh Nguyen <btnguyen2k@gmail.com>. All rights reserved.
//----------------------------------------------------------------------
//  Swift implementation of Twitter's Snowflake.
//  * 128-bit ID:
//    <64-bits: timestamp><48-bits: node id><16-bits: sequence number>
//    (where timestamp is UNIX timestamp in milliseconds)
//  * 64-bit ID:
//    <41-bits: timestamp><21-bits: node id><2-bits: sequence number>
//    (where timestamp is UNIX timestamp in milliseconds, minus the epoch)
//----------------------------------------------------------------------

import Foundation
import UIKit

public class SnowflakeIdGenerator {
    private let MASK_TIMESTAMP_64  :UInt64 = (1 << 41) - 1 // 41 bits
    private let MASK_NODE_ID_64    :UInt64 = (1 << 21) - 1 // 21 bits
    private let MASK_SEQUENCE_64   :UInt64 = (1 <<  2) - 1 //  2 bits
    private let MAX_SEQUENCE_64    :UInt64 = (1 <<  2) - 1 //  2 bits
    private let SHIFT_TIMESTAMP_64 :UInt64 = 21+2
    private let SHIFT_NODE_ID_64   :UInt64 = 2
    private let TIMESTAMP_EPOCH    :UInt64 = 1456790400000 //1-Mar-2016 GMT

    private let MASK_NODE_ID_128   :UInt64 = 0xFFFFFFFFFFFF // 48 bits
    private let MASK_SEQUENCE_128  :UInt64 = 0xFFFF         // 16 bits
    private let MAX_SEQUENCE_128   :UInt64 = 0xFFFF         // 16 bits
    private let SHIFT_TIMESTAMP_128:UInt64 = 64
    private let SHIFT_NODE_ID_128  :UInt64 = 16

    private var nodeId                :UInt64 = 0
    private var template64            :UInt64 = 0
    private var sequenceMillisec      :UInt64 = 0
    private var lastTimestampMillisec :UInt64 = 0

    init(nodeId: UInt64 = 0) {
        if ( nodeId != 0 ) {
            self.nodeId = nodeId
        } else {
            self.nodeId = UInt64(UIDevice.current.identifierForVendor!.hashValue)
        }
        self.template64 = (self.nodeId & MASK_NODE_ID_64) << SHIFT_NODE_ID_64;
    }

    public func getNodeId() -> UInt64 {
        return self.nodeId
    }

    public func getSequenceMillisec() -> UInt64 {
        return self.sequenceMillisec
    }

    public func getLastTimestampMillisec() -> UInt64 {
        return self.lastTimestampMillisec
    }

    // Generates a 64-bit id.
    // Format: <41-bit: timestamp><10-bit: node id><13 bit: sequence number>
    // Where timestamp is in millisec, minus the epoch.
    //
    // @return the generated 64-bit id
    public func generateId64() -> UInt64 {
        let result = synchronizd(lock: self) {
            let timestamp: UInt64 = DateTimeUtils.currentUnixTimestampMillisec()
            var sequence: UInt64 = 0
            if (timestamp == self.lastTimestampMillisec) {
                // increase sequence
                sequence = self.sequenceMillisec.advanced(by: 1)
                if (sequence > self.MAX_SEQUENCE_64) {
                    // reset sequence
                    self.sequenceMillisec = 0
                    DateTimeUtils.waitTillNextMillisec(currentMillisec: timestamp)
                    return self.generateId64()
                } else {
                    self.sequenceMillisec = sequence
                }
            } else {
                // reset sequence
                self.sequenceMillisec = sequence
                self.lastTimestampMillisec = timestamp
            }
            let timestampPart = (timestamp - self.TIMESTAMP_EPOCH) & self.MASK_TIMESTAMP_64
            let result = timestampPart << self.SHIFT_TIMESTAMP_64 | self.template64
                | (sequence & self.MASK_SEQUENCE_64);
            return result;

        }
        return result as! UInt64
    }

    // Generates a 64-bit id as a hex string.
    // Format: <41-bit: timestamp><10-bit: node id><13 bit: sequence number>
    // Where timestamp is in millisec, minus the epoch.
    //
    // @return the generated 64-bit id as a hex string
    public func generateId64Hex() -> String {
        let result = self.generateId64()
        return String(result, radix: 16)
    }

    // Generates a 64-bit id as a binary string.
    // Format: <41-bit: timestamp><10-bit: node id><13 bit: sequence number>
    // Where timestamp is in millisec, minus the epoch.
    //
    // @return the generated 64-bit id as a binary string
    public func generateId64Bin() -> String {
        let result = self.generateId64()
        return String(result, radix: 2)
    }

    // Generates a 128-bit id.
    // Format: <64-bits: timestamp><48-bits: node id><16-bits: sequence number>
    // Where timestamp is in millisec.
    //
    // @return the generated 128-bit id as an array of two UInt64s
    public func generateId128() -> [UInt64] {
        let result = synchronizd(lock: self) {
            let timestamp: UInt64 = DateTimeUtils.currentUnixTimestampMillisec()
            var sequence: UInt64 = 0
            if (timestamp == self.lastTimestampMillisec) {
                // increase sequence
                sequence = self.sequenceMillisec.advanced(by: 1)
                if (sequence > self.MAX_SEQUENCE_128) {
                    // reset sequence
                    self.sequenceMillisec = 0
                    DateTimeUtils.waitTillNextMillisec(currentMillisec: timestamp)
                    return self.generateId128()
                } else {
                    self.sequenceMillisec = sequence
                }
            } else {
                // reset sequence
                self.sequenceMillisec = sequence
                self.lastTimestampMillisec = timestamp
            }
            let first = timestamp
            let second = (self.nodeId << self.SHIFT_NODE_ID_128) | (sequence & self.MASK_SEQUENCE_128)
            return [first, second]
        }
        return result as! [UInt64]
    }

    // Generates a 128-bit id as a hex string.
    // Format: <64-bits: timestamp><48-bits: node id><16-bits: sequence number>
    // Where timestamp is in millisec.
    //
    // @return the generated 128-bit id as a hex string
    public func generateId128Hex() -> String {
        let result = self.generateId128()
        var tail = String(result[1], radix: 16)
        while ( tail.characters.count < 16 ) {
            tail.insert("0", at: tail.startIndex)
        }
        return String(result[0], radix: 16) + tail
    }

    // Generates a 128-bit id as a binary string.
    // Format: <64-bits: timestamp><48-bits: node id><16-bits: sequence number>
    // Where timestamp is in millisec.
    //
    // @return the generated 128-bit id as a binary string
    public func generateId128Bin() -> String {
        let result = self.generateId128()
        var tail = String(result[1], radix: 2)
        while ( tail.characters.count < 64 ) {
            tail.insert("0", at: tail.startIndex)
        }
        return String(result[0], radix: 2) + tail
    }
}
