//: Playground - noun: a place where people can play

import UIKit
import SwiftUtils
@testable import SwiftUtils

/*--- START DateTimeUtils ----*/
//let df = DateFormatter()
//df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSZ"
//
//let d1 = Date()
//print("Original date  :", d1)
//print("Date format    :", df.string(from: d1))
//print("+2 weeks format:", df.string(from: DateTimeUtils.addWeeks(d1, numWeeks: 2)))
/*--- END DateTimeUtils ----*/

/*--- START RSAUtils ----*/
let pubKey64 = "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAkw7pYdYdpFJhpb0D4hWesYA7hvC7ykRGO8VlsiJYuf7BgLZeUE5OYEP+mynePuHEh6SPhzkxgHp/LFSQdFrNIJRslOrE35yAEE2+nYQzZSgDPIFC8tN9458/bFiKExFfgUn8Eu6rhXGSPJOD93dRPspVCq0ZyOKzANPJfi8kixb/kDUU2ZKr9Gc8Rgt1JWgED4eribrtU14AvUzXibF5n1TFmbQ33Ik22U3Rrm6i914cP4de5fn02WiIBA1ohXwQRemUxlb1Sj7YFKqMo8nNBioGoRMsSpbzBiYyQfN93VE/ehMUQIjAx5AIhALo5qMWuGjYYQZo5Tz5EhnqyzUvD6F0R3Ii2GcMTPIqHmmciLQNIyLdJoG9NJxbGpEzogNIoFQ4BNGYQLlZ6Z7wHTKZs5nvWCA0Pbb1t24jQ2rgw+gEQ1krcM/Q6zuL5+3pIARiSmt3wrNYrzCZ9gM/xmxE8OFizLA9KjOnEUqB6ULj0KT6MkFB8EqN4VHSnLsbALfefTw57UldYQweui0GRZwQ+dnjs7rd7DvAIifdDjY8AVX4iJ2qYMwUiHhjlKBjPW1CQpeU+Emdl1oY1/gTHOeJOoBZd8wRpLFFY7V0JR2aQhi9eVwpn5GT0w4DML+tNDbil2m8StySom760MbnHtIy6HIK7E4HF8Iq9lZZpsKUL+MCAwEAAQ=="
let privKey64 = "MIIJQwIBADANBgkqhkiG9w0BAQEFAASCCS0wggkpAgEAAoICAQCTDulh1h2kUmGlvQPiFZ6xgDuG8LvKREY7xWWyIli5/sGAtl5QTk5gQ/6bKd4+4cSHpI+HOTGAen8sVJB0Ws0glGyU6sTfnIAQTb6dhDNlKAM8gULy033jnz9sWIoTEV+BSfwS7quFcZI8k4P3d1E+ylUKrRnI4rMA08l+LySLFv+QNRTZkqv0ZzxGC3UlaAQPh6uJuu1TXgC9TNeJsXmfVMWZtDfciTbZTdGubqL3Xhw/h17l+fTZaIgEDWiFfBBF6ZTGVvVKPtgUqoyjyc0GKgahEyxKlvMGJjJB833dUT96ExRAiMDHkAiEAujmoxa4aNhhBmjlPPkSGerLNS8PoXRHciLYZwxM8ioeaZyItA0jIt0mgb00nFsakTOiA0igVDgE0ZhAuVnpnvAdMpmzme9YIDQ9tvW3biNDauDD6ARDWStwz9DrO4vn7ekgBGJKa3fCs1ivMJn2Az/GbETw4WLMsD0qM6cRSoHpQuPQpPoyQUHwSo3hUdKcuxsAt959PDntSV1hDB66LQZFnBD52eOzut3sO8AiJ90ONjwBVfiInapgzBSIeGOUoGM9bUJCl5T4SZ2XWhjX+BMc54k6gFl3zBGksUVjtXQlHZpCGL15XCmfkZPTDgMwv600NuKXabxK3JKibvrQxuce0jLocgrsTgcXwir2VlmmwpQv4wIDAQABAoICADtPiFEtSkc78qYl1asZjSeJ0HhcH2E0qB7zPlDaCW76kJCY/PDmpDWvNsDd4gT6iYkrlbe0GYL35NK8SIalGJZLRn/JMB3/wKbStE5TQ2dI/AUrHRVStzNWxv2ruAR4vUwnysLX/9WSOKi11kO4m8v3TtU/e2bKB+gNgvahjNuMKwa+YepefXvVJzoY5OZxTTH2RfkGqzE0eJfgpg2ixqq8RfX3+Y+4x6Zc/HSdqpyaGEqHDn8ykM4emr0Hq2Aq6WVJD/fumn+XWQ78ujxU55vU11efo/1xZBLW1O5Ehj78xd02VLSycw4JyWV0xvo+TKuTnbGEJEpQjSP/z/KlQJUtaY+vaicRwGV5uLVA7jxJQlFHrENQd47sRsZEnwmsBwUWfu7ZSf6YLhnV5XRM5oumnSM9wfiJR3XlOAz6wBYRjY/XbnYW/4uHFmxEXkjuWQBWyI9/OTYHYTrZDgIWnmdW4bP+9tuXzbaSkAisW850w59z3lLD5967WMuYRNgJYXrxc415dWlKU4N3n8eyhAr86dJ+yzIg/mfoAN+uSns+cOm+wnjjOiA8Ea6cusVpm9+UoXgjr6Ir4f4oDzYJYuo4snJL0Ilb/GYPXs1sjOPHizPT9GzL+6Aei1C00tY1Vn2qaoup/4mXYJ9t+ZAsWv+QGnTLrkJxQ+A1p2jnNmYBAoIBAQDuoEfVFFNbQQSAPUjLgXlI7CREIRbsKtjqOHbOZHBw5sbf0O1tFk6+dI/SNRQQE1g8PBakIaE02hQwkS0TJ1W6V4hPIXO7o1zavkk05WqlfPY2IdlyDETB5hANsTycCA4WIYROZ9Z+aQI2xKlA8VoQoTOpdnmENOwzhhIU09hA4/hNMtKucMCnOnqB8Ab7TLBhM5Mlis79TCnqWmLI7f5svyM/I1ZFIs2FYqn1IoWA4Ldg1LIzxeBw55Gza37J0/gSmAOARCOfCgxESklOC2EVje6ZlOVvYBkBLLzi6I9bgf1lGa1fOia6qFBr7Y3kFDo84ghVN9w6iy15KAS46Oh3AoIBAQCdw+kOjMCXf77k7P/UTyes2NXc5hrF+FSHxmliXtyLZvPSlOirPYenZwkuDf9ZbpCLy1Wt66eOgU1EkFyDm4Oz1o6r1mjhc0Pua84xKgK67O9UPfxlKm2GptwYzYApLqYm5+sWanRrFGOvQkFIQdrV4IwAkl+CNyZdmzInqxtPXuTT7HXoYNKa2ZPcVXn09Ao8q6OZYEb3UcqebsKGT3f6Jwft59HBVhz7MrYm0qxp45/RtF9zDjR5lAtI3UDmTJ/CZetTNqymUkGiFb6RUVrtCSfmwzV7EdPUoU6rdJNr/Yz+DBYpjofhKa4VTx+/1Ry+g/YyvIAHQMcRMBjog3r1AoIBAQChXaX1w77ysK74gXjelXmNBJMpty6nGfqBuRkuTOF0l7rY05Ia+MDbLjurrNUaYdqDMScmas92zBpnFWVj1G+2iUbWLAr1Um2SRqd+q71Il45v4MgIxZ8heBBXEgmoghH0iUnNM47rANvMaYUDM7LyF/C1ojZeXuNznDBSAUf16bOZkMrDx9+ftn3trIEsIxoLQTM6afm7dGvL3L98nOQ2abLOGXlXW0eb8bJ44JVjJ5MaWfr/48n4z7/JkuG0XjEdccq8TFfCTqso6wtTSYKnbslw9i2I+XUvRC+fSiDXgrn2SjzhbpOOGg/4TDZti/gt/7Qe3J2CwWdIzPUUjfvVAoIBAE3GKrpVgQwumbjZbTUI4JJBQwznEwPNbD6S/ZjVEvxWAJUre5gPeTR5gvkFRYCdFP0VfGOE7NE/xQur7y+iFsctWqAzzvh1jmOXGcr63uWvsDxjYm2tANmEoLRJeojSym4bnrUqPcIcBxh7HRu1+1+8lsghYJwc+/jhbVRI8emq6jvfMjEgqjJUWKQiL0EmnXVTWA9gexupYq3ABH2Z55eWbj5GLg2Vmivr0AhLi1uYL01+Eh/yPMRCy11cVYYy9/8pp10acvp7SofRGGUjKiP4g4crbM4C9962tsWnbpWqJTuIUdSiwzGpDnzKyOgU81qoS1Kvwp3QvVIn19+oEZECggEBAMrTCHmNl9vfSz5o9vE9LVen5Kx/0PMAccDBHIHjkYg+6gUfoTW0dEPQuhtTLys3RntpjQrnuH/+RpJVwNzKKWHLmx4u8NZXR2un+0uJ18Ya++o5a04CjycO0PMVkKIcN/ujpPIo/FEMXrnN4gPMDnTMDjwCeAjjuvQUImOf6CjPIogK7S68gCplezz1OQGvlsA28y0fPUBQITQThVh+SZP4byRuS21tNk0SgJNwcf/KTvT/xfI9TmmCG9+jpDKhEymLQgEYGPRU/EhBgsSqyB4J5q8vOVhGcvRolwdWuqufl1tLTKLKHwSD7nlN8bRJiwX+JPFM0GY+as6CMlaRh98="

let tagPublic = "com.github.btnguyen2k.ios.SwiftUtilsPlayground.public"
let tagPrivate = "com.github.btnguyen2k.ios.SwiftUtilsPlayground.private"
let keyRef = try RSAUtils.addRSAPublicKey(pubKey64, tagName: tagPublic)

//let orgString = "This a string"
//let encData = try! RSAUtils.encryptWithRSAPublicKey(str: orgString, pubkeyBase64: pubKey64, tagName: "com.github.btnguyen2k.ios.SwiftUtilsPlayground.public")

//        let eData = Data(base64Encoded: eData64, options: [])
//
////        let data = "I'm a string"
////
////        let eData = try! RSAUtils.encryptWithRSAPublicKey(str: data, pubkeyBase64: pubKey64, tagName: "com.github.btnguyen2k.ios.SwiftUtilsPlayground.public")
//        let dData = try! RSAUtils.decryptWithRSAPrivateKey(encryptedData: eData!, privkeyBase64: privKey64, tagName: "com.github.btnguyen2k.ios.SwiftUtilsPlayground.private")
//        let dDataStr = String(data: dData!, encoding: .utf8)
//
//        //NSLog("Original data : \(data)")
//        NSLog("Encrypted data: \(eData!)")
//        NSLog("Decrypted data: \(dData!)")
//        NSLog("Decrypted data: \(dDataStr!)")


/*--- END RSAUtils ----*/

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
