//
//  DateTimeUtils.swift
//  SwiftUtils
//
//  Created by Thanh Nguyen on 8/15/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//----------------------------------------------------------------------
//  Useful DateTime utilities.
//----------------------------------------------------------------------

import Foundation

public class DateTimeUtils {
    // Gets current UNIX timestamp in milliseconds as a UInt64.
    //
    // @return the current UNIX timestamp in milliseconds
    public static func currentUnixTimestampMillisec() -> UInt64 {
        return UInt64(NSDate().timeIntervalSince1970 * 1000)
    }

    // Gets current UNIX timestamp in seconds as a UInt64.
    //
    // @return the current UNIX timestamp in seconds
    public static func currentUnixTimestampSecond() -> UInt64 {
        return UInt64(NSDate().timeIntervalSince1970)
    }

    // Waits until clock moves to the next millisecond.
    //
    // @param currentMillisec
    // @return the "next" millisecond
    @discardableResult public static func waitTillNextMillisec(currentMillisec: UInt64) -> UInt64 {
        var nextMillisec = currentUnixTimestampMillisec()
        while ( nextMillisec <= currentMillisec ) {
            nextMillisec = currentUnixTimestampMillisec()
        }
        return nextMillisec
    }

    // Waits until clock moves to the next second.
    //
    // @param currentSecond
    // @return the "next" second
    @discardableResult public static func waitTillNextSecond(currentSecond: UInt64) -> UInt64 {
        var nextSecond = currentUnixTimestampSecond()
        while ( nextSecond <= currentSecond ) {
            nextSecond = currentUnixTimestampSecond()
        }
        return nextSecond
    }
}
