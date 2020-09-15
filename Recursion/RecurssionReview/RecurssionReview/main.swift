//
//  main.swift
//  RecurssionReview
//
//  Created by casandra grullon on 9/15/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import Foundation

func greeting() {
    print("Hello")
}
greeting()
//call stack looks like:
// greeting()
// main -> calls greeting
// start -> when greeting is returned, its gets popped off call stack

// power(x, y)
// power(2, 3) -> 2 * 2 * 2 = 8
// power(3, 2) -> 3 * 3 = 9

//1. base case -> y > 0
//2. recursive call

func power(x: Int, y: Int) -> Int {
    //basecase
    guard y > 1 else {
        return x
    }
    // recursive call
    return x * power(x: x, y: y - 1)
}

let result = power(x: 2, y: 3)
print(result) // 8
