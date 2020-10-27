import UIKit

//https://leetcode.com/problems/search-insert-position/
//Example 1:
//Input: nums = [1,3,5,6], target = 5
//Output: 2
//
//Example 2:
//Input: nums = [1,3,5,6], target = 2
//Output: 1
//
//Example 3:
//Input: nums = [1,3,5,6], target = 7
//Output: 4

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    //1. check if target is in array
    //a. if it is, return index
    //b. if its not insert it where current < target && next > target
    let min = nums.min() ?? 0
    let max = nums.max() ?? 0
    
    if target > max {
        return nums.count
    } else if target < min {
        return 0
    }
    
    for i in 0..<nums.count {
        if nums[i] == target {
            return i
        } else if nums[i] < target && nums[i + 1] > target {
            return i + 1
        }
    }
    return -1
}

searchInsert([1,3,5,6], 5)//2
searchInsert([1,3,5,6], 2)//1
searchInsert([1,3,5,6], 7)//4
