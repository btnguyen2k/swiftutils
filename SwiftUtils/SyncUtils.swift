//
//  SyncUtils.swift
//  SwiftUtils
//
//  Created by Thanh Nguyen on 8/15/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

// Synchronized a code block
// Credit: http://yuhua-chen.logdown.com/posts/253806-synchronized-on-swift
// Usage:
// synchronizd(self) {
//     .... code here ....
// }
@discardableResult public func synchronizd(lock: AnyObject, closure:()->Any?) -> Any? {
    objc_sync_enter(lock)
    let result = closure()
    objc_sync_exit(lock)
    return result
}
