import UIKit

//https://leetcode.com/problems/search-in-rotated-sorted-array/description/

//Input: nums = [4,5,6,7,0,1,2], target = 0
//Output: 4

func search(_ nums: [Int], _ target: Int) -> Int {
    var dictionary = [Int: Int]()
    
    for (index, num) in nums.enumerated() {
        dictionary[index] = num
    }
    for (key, value) in dictionary {
        if value == target {
            return key
        }
    }
    return -1
}
//95.99%
func search1(_ nums: [Int], _ target: Int) -> Int {
    return nums.firstIndex(of: target) ?? -1
}
search([4,5,6,7,0,1,2], 0)

//https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
//Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
//(i.e., [0,0,1,2,2,5,6] might become [2,5,6,0,0,1,2]).
//You are given a target value to search. If found in the array return true, otherwise return false.
//Example 1:
//Input: nums = [2,5,6,0,0,1,2], target = 0
//Output: true
//Example 2:
//Input: nums = [2,5,6,0,0,1,2], target = 3
//Output: false
func searchII(_ nums: [Int], _ target: Int) -> Bool {
    var dictionary = [Int: Int]()
    
    for (index, num) in nums.enumerated() {
        dictionary[index] = num
    }
    for (_, value) in dictionary {
        if value == target {
            return true
        }
    }
    return false
}
searchII([2,5,6,0,0,1,2], 3)
