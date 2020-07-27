import UIKit

//https://leetcode.com/problems/running-sum-of-1d-array/

//Input: nums = [1,2,3,4]
//Output: [1,3,6,10]
//Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].

func runningSum(_ nums: [Int]) -> [Int] {
    var results = [Int]()
    var arrayCopy = nums
    var sum = Int()
    
    for num in arrayCopy {
        sum += num
        results.append(sum)
        arrayCopy.removeLast()
    }
    return results
}
var nums = [3,1,2,10,1]
runningSum(nums)
