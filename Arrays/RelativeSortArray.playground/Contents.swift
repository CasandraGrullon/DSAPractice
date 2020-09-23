import UIKit

//https://leetcode.com/problems/relative-sort-array/
//Given two arrays arr1 and arr2, the elements of arr2 are distinct, and all elements in arr2 are also in arr1.
//Sort the elements of arr1 such that the relative ordering of items in arr1 are the same as in arr2.  Elements that don't appear in arr2 should be placed at the end of arr1 in ascending order.
//Example 1:
//Input: arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
//Output: [2,2,2,1,4,3,3,9,6,7,19]

func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    guard arr1.count >= arr2.count else {
        return []
    }
    guard arr1.count > 0, arr2.count > 0 else {
        return []
    }
    
    var dict = [Int: Int]()
    
    for num in arr1 {
        if let value = dict[num] {
            dict[num] = value + 1
        } else {
            dict[num] = 1
        }
    }
    
    var results = [Int]()
    var i = 0
    
    while i < arr2.count {
        for (key, value) in dict {
            if key == arr2[i] {
                results.append(contentsOf: Array(repeating: key, count: value))
                dict[key] = 0
            }
        }
        i += 1
    }
    for (key, value) in dict.sorted(by: {$0 < $1}) {
        if value > 0 {
            results.append(contentsOf: Array(repeating: key, count: value))
        }
    }
    
    return results
}
print(relativeSortArray([2,3,1,3,2,4,6,7,9,19,2], [2,1,4,3,9,6]))
//[2,2,2,1,4,3,3,9,6,7,19]
print(relativeSortArray([2,21,43,38,0,42,33,7,24,13,12,27,12,24,5,23,29,48,30,31],
[2,42,38,0,43,21]))
//[2,42,38,0,43,21,5,7,12,12,13,23,24,24,27,29,30,31,33,48]
