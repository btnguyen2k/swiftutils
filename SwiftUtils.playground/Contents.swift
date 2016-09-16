//: Playground - noun: a place where people can play

import UIKit
@testable import SwiftUtils

let df = DateFormatter()
df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"

let d1 = Date()
df.string(from: d1)
df.string(from: DateTimeUtils.startOfSecond(d1))
df.string(from: DateTimeUtils.startOfMinute(d1))
df.string(from: DateTimeUtils.startOfHour(d1))
df.string(from: DateTimeUtils.startOfDay(d1))
df.string(from: DateTimeUtils.startOfMonth(d1))
df.string(from: DateTimeUtils.startOfYear(d1))
df.string(from: DateTimeUtils.startOfWeek(d1))

let d2 = NSDate()
df.string(from: d2 as Date)

let idGen = SnowflakeIdGenerator(103)
//let idGen2 = SnowflakeIdGenerator(1981)
let id64 = idGen.generateId64()
SnowflakeIdGenerator.extractTimestamp64(id64)

//
//idGen.generateId128()
//idGen.generateId128Hex()
//idGen.generateId128Bin()
//
//idGen2.generateId64()
//idGen2.generateId64Hex()
//idGen2.generateId64Bin()
//
//let cal = NSCalendar.current
//let date = NSDate()
////DateFormatter("yyyy-MM-dd HH:mm:ss").string(from: date as Date)
//let df = DateFormatter()
//df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
//
//cal.component(Calendar.Component.weekday, from: date as Date)
//cal.firstWeekday
//
////let currentDateComponents = cal.dateComponents([.year, .month, .day, .weekOfYear], from: date as Date)
////df.string(from: cal.date(from: currentDateComponents)!)
//
////df.string(from: DateTimeUtils.startOfWeek(date) as Date)
//
//df.string(from: date as Date)
////df.string(from: cal.startOfDay(for: date as Date))
////df.string(from: DateTimeUtils.startOfSecond(date) as Date)
////df.string(from: DateTimeUtils.startOfMinute(date) as Date)
////df.string(from: DateTimeUtils.startOfHour(date) as Date)
////df.string(from: DateTimeUtils.startOfDate(date) as Date)
////df.string(from: DateTimeUtils.startOfMonth(date) as Date)
////df.string(from: DateTimeUtils.startOfYear(date) as Date)
//df.string(from: DateTimeUtils.startOfWeek(date) as Date)
//cal.component(Calendar.Component.weekday, from: date as Date)
//var d = DateTimeUtils.startOfDate(date) as Date
//cal.date(byAdding: Calendar.Component.weekday, value: -1, to: d)!
//
////cal.startOfDay(for: date as Date)
////DateTimeUtils.startOfMinute(date)
////var comps = cal.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year, Calendar.Component.weekOfYear, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second, Calendar.Component.nanosecond], from: date as Date)
////comps.setValue(1, for: Calendar.Component.hour)
////cal.date(from: comps)
//
////let components: NSDateComponents = cal?.components(NSCalendar.Unit.CalendarUnit, fromDate: date)
//
//date
//
//
///*
//idGen.generateId64()
//idGen.generateId64Hex()
//idGen.generateId64Bin()
//
//idGen2.generateId64()
//idGen2.generateId64Hex()
//idGen2.generateId64Bin()
//
//idGen.getLastTimestampMillisec()
//idGen2.getLastTimestampMillisec()
//
//idGen.generateId128()
//idGen.generateId128Hex()
//idGen.generateId128Bin()
//
//idGen2.generateId128()
//idGen2.generateId128Hex()
//idGen2.generateId128Bin()
//*/
//
////String(12345, radix: 2)
////String(83630470, radix: 2)
//
////idGen.generateId64()
////idGen.generateId128()
////var id = idGen.generateId128Hex()
////let index = id.index(id.endIndex, offsetBy: -16)
////id.substring(to: index)
////SnowflakeIdGenerator.extractTimestamp128Hex(idHex: id)
////SnowflakeIdGenerator.extractTimestamp128HexAsDate(idHex: id)
//
////idGen2.generateId64()
////idGen2.generateId128()
////var id2 = idGen2.generateId128Hex()
////SnowflakeIdGenerator.extractTimestamp128Hex(idHex: id2)
////SnowflakeIdGenerator.extractTimestamp128HexAsDate(idHex: id2)
