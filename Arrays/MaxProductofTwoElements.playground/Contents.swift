import UIKit

//https://leetcode.com/problems/maximum-product-of-two-elements-in-an-array/

//Given the array of integers nums, you will choose two different indices i and j of that array. Return the maximum value of (nums[i]-1)*(nums[j]-1).
//Example 1:
//Input: nums = [3,4,5,2]
//Output: 12
//Explanation: If you choose the indices i=1 and j=2 (indexed from 0), you will get the maximum value, that is, (nums[1]-1)*(nums[2]-1) = (4-1)*(5-1) = 3*4 = 12.

//Example 2:
//Input: nums = [1,5,4,5]
//Output: 16
//Explanation: Choosing the indices i=1 and j=3 (indexed from 0), you will get the maximum value of (5-1)*(5-1) = 16.
func maxProduct(_ nums: [Int]) -> Int {
    
    guard !nums.isEmpty else {
        return 0
    }
    if nums.count == 1 {
        return nums[0]
    }
    let sorted = nums.sorted {$0 > $1}
    var products = [Int]()
    
    let prod = product(num1: sorted[0], num2: sorted[1])
    products.append(prod)
    
    return products.max() ?? 0
}
func product(num1: Int, num2: Int) -> Int {
    return (num1 - 1) * (num2 - 1)
}
maxProduct([3,4,5,2])//12
maxProduct([1,5,4,5])//16
maxProduct([7,3])//12

//https://leetcode.com/problems/subarray-product-less-than-k/
//Your are given an array of positive integers nums.
//Count and print the number of (contiguous) subarrays where the product of all the elements in the subarray is less than k.
//Example 1:
//Input: nums = [10, 5, 2, 6], k = 100
//Output: 8
//Explanation: The 8 subarrays that have product less than 100 are: [10], [5], [2], [6], [10, 5], [5, 2], [2, 6], [5, 2, 6].
//Note that [10, 5, 2] is not included as the product of 100 is not strictly less than k.
func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    var set: Set<[Int]> = []
    
    for num in 0..<nums.count {
        if nums[num] < k {
            set.insert([num])
        }
    }
    
    var index = 0
    
    while index < nums.count {
        if let subArray = createSubArrays(array: nums, start: index, end: nums.count - 1, k: k) {
            set.insert(subArray)
        }
        index += 1
    }
    
    let middleIndex = nums.count / 2
    for i in 0...middleIndex {
        if let subArray = createSubArrays(array: nums, start: i, end: middleIndex, k: k) {
            var indicies = [Int]()
            indicies.append(contentsOf: subArray.indices)
            set.insert(indicies)
        }
    }
    for j in middleIndex..<nums.count {
        if let subArray = createSubArrays(array: nums, start: j, end: nums.count - 1, k: k) {
            var indicies = [Int]()
            indicies.append(contentsOf: subArray.indices)
            set.insert(indicies)
        }
    }
    print(set)
    return set.count
}
func checkSubArray(array: [Int], k: Int) -> Bool {
    if array.reduce(1, *) < k {
        return true
    }
    return false
}
func createSubArrays(array: [Int], start: Int, end: Int, k: Int) -> [Int]? {
    var newArray = Array(array[start...end])
    
    guard newArray.count > 1 else {
        return nil
    }
    while newArray.count > 1 {
        if checkSubArray(array: newArray, k: k) {
            return newArray
        }
        newArray.removeLast()
    }
    
    return nil
}
numSubarrayProductLessThanK([10,5,2,6], 100)//8
numSubarrayProductLessThanK([100], 100)//0
numSubarrayProductLessThanK([1,1,1], 2)//6
numSubarrayProductLessThanK([10,9,10,4,3,8,3,3,6,2,10,10,9,3], 19)//18
