import UIKit

//https://leetcode.com/problems/number-of-good-pairs/
//Input: nums = [1,2,3,1,1,3]
//Output: 4
//Explanation: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.

func numIdenticalPairs(_ nums: [Int]) -> Int {
    var dictionary: [Int: Int] = [:]
    var count = 0
    
    for num in nums {
        if let value = dictionary[num] {
            count += value
            //[1:1] -> [1:2] -> [1:3] = 3
            //[3:1] = 1
            // 3 + 1 = 4
        }
        dictionary[num, default: 0] += 1
        //[1:0], [2:0], [3:0]
    }
    return count
}
let nums = [1,2,3,1,1,3]
numIdenticalPairs(nums)
