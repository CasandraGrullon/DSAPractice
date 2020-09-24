import UIKit
//https://leetcode.com/problems/kth-largest-element-in-an-array/
//Example 1:
//Input: [3,2,1,5,6,4] and k = 2
//Output: 5
//
//Example 2:
//Input: [3,2,3,1,2,4,5,5,6] and k = 4
//Output: 4

//Note:
//You may assume k is always valid, 1 ≤ k ≤ array's length.

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    //1. sort array decending
    //2. return value at index + 1 == k
    let sorted = nums.sorted(by: {$0 > $1})
    return sorted[k - 1]
}
findKthLargest([3,2,1,5,6,4], 2)
findKthLargest([3,2,3,1,2,4,5,5,6], 4)
