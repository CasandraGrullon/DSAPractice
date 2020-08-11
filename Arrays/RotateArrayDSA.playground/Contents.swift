import UIKit

//https://leetcode.com/problems/rotate-array/
//Given an array, rotate the array to the right by k steps, where k is non-negative.

//Input: nums = [1,2,3,4,5,6,7], k = 3
//Output: [5,6,7,1,2,3,4]
//Explanation:
//rotate 1 steps to the right: [7,1,2,3,4,5,6]
//rotate 2 steps to the right: [6,7,1,2,3,4,5]
//rotate 3 steps to the right: [5,6,7,1,2,3,4]
func rotate(_ nums: inout [Int], _ k: Int) {
    if k < 1 || nums.count == 0 {
        return
    }
    var count = k
    while count >= 1 {
        if let lastValue = nums.popLast() {
            nums.insert(lastValue, at: 0)
            
        }
        count -= 1
    }
    
}
var nums = [1,2,3,4,5,6,7]
rotate(&nums, 3)
