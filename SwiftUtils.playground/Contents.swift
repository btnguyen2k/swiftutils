//: Playground - noun: a place where people can play

import UIKit
@testable import SwiftUtils

let idGen = SnowflakeIdGenerator(nodeId: 12345)
let idGen2 = SnowflakeIdGenerator()

/*
idGen.generateId64()
idGen.generateId64Hex()
idGen.generateId64Bin()

idGen2.generateId64()
idGen2.generateId64Hex()
idGen2.generateId64Bin()

idGen.getLastTimestampMillisec()
idGen2.getLastTimestampMillisec()

idGen.generateId128()
idGen.generateId128Hex()
idGen.generateId128Bin()

idGen2.generateId128()
idGen2.generateId128Hex()
idGen2.generateId128Bin()
*/

//String(12345, radix: 2)
//String(83630470, radix: 2)

idGen.generateId64()
idGen.generateId128()
var id = idGen.generateId128Hex()
let index = id.index(id.endIndex, offsetBy: -16)
id.substring(to: index)
SnowflakeIdGenerator.extractTimestamp128Hex(idHex: id)
SnowflakeIdGenerator.extractTimestamp128HexAsDate(idHex: id)

idGen2.generateId64()
idGen2.generateId128()
var id2 = idGen2.generateId128Hex()
SnowflakeIdGenerator.extractTimestamp128Hex(idHex: id2)
SnowflakeIdGenerator.extractTimestamp128HexAsDate(idHex: id2)
