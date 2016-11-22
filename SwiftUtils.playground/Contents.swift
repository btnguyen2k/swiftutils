//: Playground - noun: a place where people can play

import UIKit
@testable import SwiftUtils
//
//var privKeyStr = "-----BEGIN RSA PRIVATE KEY-----\n" +
//"MIIEpAIBAAKCAQEAtVDMVHzXEweGJH600LQsa8cpd9lrtwEbU6mOJ6/paKB4GaDpVQLbe1B6vRtE\n" +
//"QHYVjvJRUZvMpP/C5iNWrI8MCsxp5QfySPU1O+lVOK9/sCZZNZvbjLnNF1MRbgW0cNZ6B69hAPk7\n" +
//"61+yKYvhLOqQvFbiKj4zsXNdALO9yt5ogP1is0KclBEZjHgv3hWeTQqe2W9qk7W4AyNXML9So5Za\n" +
//"Ftm4xj/y6N8uRDpJ9WSRJkbZY1C/GaGLOSyCAEdrpqJiv5fHN5JgjCTGA1TZC+XrIVsLh4SRSgaZ\n" +
//"owgDADvDL7bke0NcZo7YDNn8xEarKURSBqdEkvt6TNipYd3vpSXCLwIDAQABAoIBAQCo/YeT708d\n" +
//"w1N5TEcGhgco5NV3iMNmK7fmgA+oWcJ366hEar9Opn0eL+JVwsYYNnbdZmf4YfeYiXCDwsgTyLd2\n" +
//"kRLZjlB5Q2G8VztAvAGMkhFvb7ZvMPVAGgISw2psCNpvszv8Bk+cjvKk2mSi0nTXtTrSGGthpp41\n" +
//"+1CXdjd8kBqnZGy1PjQDclT5RQOQPppIV1QE5f4HJYsEjipjvEAf9KGcukL5+U2X1EYJue2cfTGH\n" +
//"VLVj9D5COsEsVX3yoJd7v6+Vv2QFJOkbQ0AR49vxezhoIVyB4Wona8jhMu5nbToB+0xwjtBPnOmr\n" +
//"KIa9sX8+lamBh8Ig8HCP0GZrpEPhAoGBAOnzQaK/LCCC9RmKS6W16EkTc5lb5AlQqiT2HUsUDFzn\n" +
//"A3ylTvUtlorsWMQTm1sidvgpFYRzNwGChK/mby55GmD7Ki4E35saXM9O8Sc5K+xHOm/Qm7ug0h/V\n" +
//"Z3vtPaygvct3Me9QTr3EzV+//LzkP0fydRuCb1yVlgdsh9ixJ393AoGBAMZnk2MN8I9hnZtNxUYH\n" +
//"K2kmJUYj2kl6RdI4HQJDefrJ6Ax+1sop1+y9wipy/7kaGvEtMjLPWQ1FDlqd63mSKDK8CoHUtppX\n" +
//"UI79w/d5aAkKBtEYS2opqYHwVoDeBJpMtII9mzGbi//mpK1peB3wKFUw8422eb5oWR2gvUXzp7EJ\n" +
//"AoGAe683jCs10RprKk2LINjDLZ8zBmkmbiZPTaswYXj/8D3SAhwDWmv3owrBAyi6gbv+2cQetB+V\n" +
//"fR7bt4NEVHWCFLO04Q+CiCWv24oIxIvdRNWDd4n6S4AClwHj7AjJCnMQ5Hjn1XXHq1xYl76Qh+zD\n" +
//"5+2vLBQRfAk5gENIrq86CpECgYAM1UA8RPeNXqQCGpqq9+W/7F621bTV0dnYShbeQZ0PMqYWwNGF\n" +
//"zAUSZAe+FSgjQeQCO4kmrjC1YgUWqWZEu8Zr2avYT/jrrMAiL5nQVQL8qrBcL/UYzc8P/4qo1TN5\n" +
//"A4MddXynTcdVawa1zL+fOBxzvjHStb3UKg2xk+cKMkNjeQKBgQDJ8bo0s/eMDw5F9oCIEOopCi2N\n" +
//"qxs6mkglF78bwO39uN92+6yK+Ue92y+DkgeYhr43hLbL7vOZmijPire4hqHsl7wTf/vzwQ0DrXkd\n" +
//"75r6xcez9oCLa61clSGP2DWSa9b+Bee0ybwWovPDeZAhnyG9rilN93DPFD374l/WREv5gA==\n" +
//"-----END RSA PRIVATE KEY-----"
//privKeyStr.characters.count
//
//let pattern = "(-----BEGIN.*?-----)|(-----END.*?-----)|\\s+"
//
//let regExp = try! NSRegularExpression(pattern: pattern, options: [])
//
//privKeyStr = regExp.stringByReplacingMatches(in: privKeyStr, options: [], range: NSRange(location: 0, length: privKeyStr.characters.count), withTemplate: "")
//privKeyStr.characters.count

let df = DateFormatter()
df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"

let d1 = Date()
df.string(from: d1)
df.string(from: DateTimeUtils.addWeeks(d1, numWeeks: 2))


//df.string(from: DateTimeUtils.startOfSecond(d1))

//df.string(from: DateTimeUtils.addSeconds(d1, numSeconds: 5))
//df.string(from: DateTimeUtils.addMinutes(d1, numMinutes: 1))
//df.string(from: DateTimeUtils.addHours(d1, numHours: 1))

//
//let d1 = Date()
//df.string(from: d1)
//df.string(from: DateTimeUtils.startOfSecond(d1))
//df.string(from: DateTimeUtils.startOfMinute(d1))
//df.string(from: DateTimeUtils.startOfHour(d1))
//df.string(from: DateTimeUtils.startOfDay(d1))
//df.string(from: DateTimeUtils.startOfMonth(d1))
//df.string(from: DateTimeUtils.startOfYear(d1))
//df.string(from: DateTimeUtils.startOfWeek(d1))
//
//let d2 = NSDate()
//df.string(from: d2 as Date)
//
//let idGen = SnowflakeIdGenerator(103)
////let idGen2 = SnowflakeIdGenerator(1981)
//let id64 = idGen.generateId64()
//SnowflakeIdGenerator.extractTimestamp64(id64)

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
