import UIKit

//https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/

//Example 1:
//Input: nums = [5,7,7,8,8,10], target = 8
//Output: [3,4]

//Example 2:
//Input: nums = [5,7,7,8,8,10], target = 6
//Output: [-1,-1]

//5.07% :(
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    var results = [Int]()
    var dictionary = [Int: Int]()
    
    for (index, num) in nums.enumerated() {
        dictionary[index] = num
    }
    for (key, value) in dictionary {
        if value == target {
            results.append(key)
        }
    }
    results = results.sorted()
    
    if results.isEmpty {
        results = Array(repeating: -1, count: 2)
    } else if results.count < 2 {
        results.append(results[0])
    } else if results.count > 2 {
        results = [results[0], results[results.count - 1]]
    }
    return results
}
searchRange([5,7,7,8,8,10], 8)
searchRange([1,1,1,1,1,3], 1)
// 29 / 88 test cases passed using binary search :(
//func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
//    var results = [Int]()
//
//    if nums.count == 1 {
//        if nums[0] == target {
//            return [0,0]
//        } else {
//            return [-1, -1]
//        }
//    }
//    while results.count < 2 {
//        let first = binarySearch(nums, target, range: 0..<nums.count)
//        let last = binarySearch(nums, target, range: first + 1..<nums.count)
//        results.append(first)
//        results.append(last)
//    }
//
//    return results
//}
//func binarySearch(_ array: [Int], _ target: Int, range: Range<Int>) -> Int {
//    guard array.count >= 2 else {
//        return -1
//    }
//    if range.lowerBound >= range.upperBound {
//        return -1
//    }
//
//    let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
//
//    if array[middleIndex] == target {
//        return middleIndex
//    } else if array[middleIndex] > target {
//        return binarySearch(array, target, range: range.lowerBound..<middleIndex)
//    } else if array[middleIndex] < target {
//        return binarySearch(array, target, range: middleIndex + 1..<range.upperBound)
//    } else {
//        return -1
//    }
//}

