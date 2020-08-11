import UIKit

// problem: https://leetcode.com/problems/binary-search/
func search(_ nums: [Int], _ target: Int) -> Int {
    let middleIndex = nums[0] + (nums[nums.count - 1] - nums[0]) / 2
    
    if nums[middleIndex] == target {
        return middleIndex
    } else if nums[middleIndex] > target {
        return search(Array(nums[0..<middleIndex]), target)
    } else if nums[middleIndex] < target {
        return search(Array(nums[middleIndex + 1 ..< nums.count - 1]), target)
    } else {
        return -1
    }
    
}
var nums = [-1,0,3,5,9,12]
var target = 9
let answer2 = search(nums, target)
print(answer2)
var nums2 = [-1,0,3,5,9,12]
var target2 = 2
let answer3 = search(nums2, target2)
print(answer3)
