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
    @discardableResult public static func waitTillNextMillisec(_ currentMillisec: UInt64) -> UInt64 {
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
    @discardableResult public static func waitTillNextSecond(_ currentSecond: UInt64) -> UInt64 {
        var nextSecond = currentUnixTimestampSecond()
        while ( nextSecond <= currentSecond ) {
            nextSecond = currentUnixTimestampSecond()
        }
        return nextSecond
    }

    static public let FULL_DATE_COMPONENTS: Set<Calendar.Component> = [Calendar.Component.era,
                                Calendar.Component.year,
                                Calendar.Component.month,
                                Calendar.Component.day,
                                Calendar.Component.hour,
                                Calendar.Component.minute,
                                Calendar.Component.second,
                                Calendar.Component.nanosecond,
                                Calendar.Component.weekday,
                                Calendar.Component.weekdayOrdinal,
                                Calendar.Component.weekOfMonth,
                                Calendar.Component.weekOfYear,
                                Calendar.Component.quarter,
                                Calendar.Component.yearForWeekOfYear,
                                Calendar.Component.calendar,
                                Calendar.Component.timeZone]

    // Resets to start of the second of a NSDate
    public static func startOfSecond(_ date: NSDate) -> NSDate {
        var comps = NSCalendar.current.dateComponents(FULL_DATE_COMPONENTS, from: date as Date)
        comps.setValue(0, for: Calendar.Component.nanosecond)
        return NSCalendar.current.date(from: comps)!
    }

    // Resets to start of the minute of a NSDate
    public static func startOfMinute(_ date: NSDate) -> NSDate {
        let d = startOfSecond(date)
        var comps = NSCalendar.current.dateComponents(FULL_DATE_COMPONENTS, from: d as Date)
        comps.setValue(0, for: Calendar.Component.second)
        return NSCalendar.current.date(from: comps)!
    }

    // Resets to start of the hour of a NSDate
    public static func startOfHour(_ date: NSDate) -> NSDate {
        let d = startOfMinute(date)
        var comps = NSCalendar.current.dateComponents(FULL_DATE_COMPONENTS, from: d as Date)
        comps.setValue(0, for: Calendar.Component.minute)
        return NSCalendar.current.date(from: comps)!
    }

    // Resets to start of the day of a NSDate
    public static func startOfDay(_ date: NSDate) -> NSDate {
        let d = startOfHour(date)
        var comps = NSCalendar.current.dateComponents(FULL_DATE_COMPONENTS, from: d as Date)
        comps.setValue(0, for: Calendar.Component.hour)
        return NSCalendar.current.date(from: comps)!
    }

    // Alias of startOfDay()
    public static func startOfDate(_ date: NSDate) -> NSDate {
        return startOfDay(date)
    }

    // Resets to start of the month of a NSDate
    public static func startOfMonth(_ date: NSDate) -> NSDate {
        let d = startOfDay(date)
        var comps = NSCalendar.current.dateComponents(FULL_DATE_COMPONENTS, from: d as Date)
        comps.setValue(1, for: Calendar.Component.day)
        return NSCalendar.current.date(from: comps)!
    }

    // Resets to start of the year of a NSDate
    public static func startOfYear(_ date: NSDate) -> NSDate {
        let d = startOfMonth(date)
        var comps = NSCalendar.current.dateComponents(FULL_DATE_COMPONENTS, from: d as Date)
        comps.setValue(1, for: Calendar.Component.month)
        return NSCalendar.current.date(from: comps)!
    }


    // Resets to start of the week of a NSDate
    public static func startOfWeek(_ date: NSDate) -> NSDate {
        let CAL = NSCalendar.current
        var result = startOfDate(date) as Date
        var weekday = CAL.component(Calendar.Component.weekday, from: result)
        while ( weekday != CAL.firstWeekday ) {
            result = CAL.date(byAdding: Calendar.Component.weekday, value: -1, to: result)!
            weekday = CAL.component(Calendar.Component.weekday, from: result)
        }
        return result
    }
}
