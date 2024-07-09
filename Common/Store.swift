//
//  Store.swift
//  ThreadCheck
//
//  Created by K Y on 1/16/20.
//  Copyright © 2020 Yu. All rights reserved.
//

import Foundation

class Store {
    private let lock: NSLock = NSLock()
    var seenThreads = [Int:Int]()
    func add(_ key: Int, _ val: Int) {
        lock.lock(); defer { lock.unlock() }
        seenThreads[key] = val
    }
    func get(_ key: Int) -> Int? {
        lock.lock(); defer { lock.unlock() }
        return seenThreads[key]
    }
}
