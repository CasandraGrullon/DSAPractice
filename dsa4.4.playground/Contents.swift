import UIKit

//Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
//ex: nums = [1,1,1], k = 2 -> output = 2

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var count = 0
    
    guard !nums.isEmpty else {
        return 0
    }
    guard nums.count > 1 else {
        return k
    }
    let range = 0...nums.count - 1
    var val1 = nums[range.lowerBound]
    var val2 = nums[range.upperBound]
    
        if val1 == k || val2 == k {
            count += 1
            val1 = nums[range.lowerBound + 1]
            val2 = nums[range.upperBound - 1]
        } else if val1 + val2 == k {
            count += 1
            val1 = nums[range.lowerBound + 1]
            val2 = nums[range.upperBound - 1]
        } else {
            val1 = nums[range.lowerBound + 1]
            val2 = nums[range.upperBound - 1]
        }
    
    
//    for i in 0...nums.count - 1 {
//        if nums[i] == k {
//            count += 1
//        } else if val1 + nums[i] == k {
//            count += 1
//            val1 = nums[i]
//            print("if val1 + nums[i] == k: val1 = \(val1)")
//        } else if val2 + nums[i] == k {
//            count += 1
//            index += 1
//            val2 = nums[nums.count - (index)]
//            print("val2 + nums[i] == k: val2 = \(val2)")
//        } else if val2 + val1 == k {
//            count += 1
//            index += 1
//            val1 = nums[i]
//            val2 = nums[nums.count - (index)]
//            print("val2 + val1 == k: val2 = \(val2)")
//            print("val2 + val1 == k: val1 = \(val1)")
//        } else if val1 == val2 {
//            return count
//        } else {
//            val1 = nums[i]
//            index += 1
//            val2 = nums[nums.count - (index)]
//        }
//
//    }
    
    
    print("val1: \(val1), val2: \(val2)")
    
    return count
}
var input = [1, 1, 1]
subarraySum(input, 2)


