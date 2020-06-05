import UIKit

//https://leetcode.com/problems/remove-duplicates-from-sorted-array/

//remove repeated numbers in array, return its count

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var freqDict = [Int: Int]()
    
    for num in nums {
        if let value = freqDict[num] {
            freqDict[num] = value + 1
        } else {
            freqDict[num] = 1
        }
    }
    
    for num in 0...nums.count - 1 {
        if var value = freqDict[nums[num]] {
            if value > 1 {
                nums.remove(at: num)
                value -= 1
            }
        }
    }
    return nums.count
}
var example1 = [1,2,2]
removeDuplicates(&example1)
