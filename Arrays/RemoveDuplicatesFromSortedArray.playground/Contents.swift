import UIKit
//https://leetcode.com/problems/remove-duplicates-from-sorted-array/submissions/
//EASY
func removeDuplicatesEASY(_ nums: inout [Int]) -> Int {
    let set = Set(nums)
    nums = Array(set.sorted())
    return nums.count
}
var nums = [1,2,1]
removeDuplicatesEASY(&nums)

//https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
//MEDIUM
//Example 1:
//Input: nums = [1,1,1,2,2,3]
//Output: 5, nums = [1,1,2,2,3]
//Explanation: Your function should return length = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively. It doesn't matter what you leave beyond the returned length.
func removeDuplicates(_ nums: inout [Int]) -> Int {
    //1. create a freq dictionary [values: count]
    //2. empty nums
    //3. for loop on dict
    //a. if count > 2 -> only append x2
    //b. else -> append xcount
    var dict = [Int: Int]()
    
    for num in nums {
        if let value = dict[num] {
            dict[num] = value + 1
        } else {
            dict[num] = 1
        }
    }
    
    nums = []
    
    for (key, value) in dict.sorted(by: {$0.key < $1.key}) {
        if value > 2 {
            let subarray = Array(repeating: key, count: 2)
            nums.append(contentsOf: subarray)
        } else {
            let subarray = Array(repeating: key, count: value)
            nums.append(contentsOf: subarray)
        }
    }
    
    return nums.count
}
var nums2 = [1,1,1,2,2,3]//5
removeDuplicates(&nums2)

