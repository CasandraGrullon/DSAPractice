import UIKit

//https://leetcode.com/problems/two-sum/
//Input: nums = [2,7,11,15], target = 9
//Output: [0,1]
//Output: Because nums[0] + nums[1] == 9, we return [0, 1].
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    var back = nums.count - 1
    
    while back > -1 {
        for i in 0..<nums.count {
            if i != back {
                if nums[i] + nums[back] == target {
                    dict[i] = nums[i]
                    dict[back] = nums[back]
                }
            }
        }
        back -= 1
    }
    
    return dict.keys.map {$0}
}
twoSum([2,7,9,15], 9)
twoSum([3,2,4], 6)
twoSum([-1,-2,-3,-4,-5],-8)
