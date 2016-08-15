//: Playground - noun: a place where people can play

import UIKit
@testable import SwiftUtils

let idGen = SnowflakeIdGenerator(nodeId: 12345)
let idGen2 = SnowflakeIdGenerator()

idGen.generateId64()
idGen.generateId64Hex()
idGen.generateId64Bin()

idGen2.generateId64()
idGen2.generateId64Hex()
idGen2.generateId64Bin()

idGen.getLastTimestampMillisec()
idGen2.getLastTimestampMillisec()

//idGen.generateId128()
//idGen.generateId128Hex()
//idGen.generateId128Bin()

//idGen2.generateId128()
//idGen2.generateId128Hex()
//idGen2.generateId128Bin()

String(12345, radix: 2)
String(83630470, radix: 2)
