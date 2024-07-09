//
//  main.swift
//  ThreadCheck
//
//  Created by K Y on 1/16/20.
//  Copyright © 2020 Yu. All rights reserved.
//

import Foundation

let store = Store()
let group = DispatchGroup()

(0...10_000).forEach { i in
    group.enter()
    DispatchQueue.global().async {
        let threadID = Thread.current.hashValue
        if let lastTime = store.get(threadID) {
            print("Seen \(lastTime) thread again at \(i)th occurrence")
        }
        else {
            store.add(threadID, i)
        }
        group.leave()
    }
}

group.notify(queue: .main) {
    print("All work done")
    print("There are \(store.seenThreads.keys.count) unique threads used")
}
 
RunLoop.current.run()

