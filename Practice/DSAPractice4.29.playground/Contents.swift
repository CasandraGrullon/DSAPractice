import UIKit


func findMaxLength(_ nums: [Int]) -> Int {
    var count = 0
    var maxLength = 0
    var freqDict = [Int: Int]() // [count: index]
    freqDict[0] = -1
    // if we have seen the count before we are looking at the contiguous subarray
    for (currentIndex, num) in nums.enumerated() {
      if num == 0 {
        count -= 1
      } else {
        count += 1
      }
      // keep track of seen counts and indices
      if let firstSeenIndex = freqDict[count] {
        maxLength = max(maxLength, currentIndex - firstSeenIndex)
      } else {
        freqDict[count] = currentIndex
      }
    }
    return maxLength

}

var input = [0,0,1,0,1,0] // [0,1,0,1] or [1,0,1,0]
print(findMaxLength(input)) // should be 4

//Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

//Example:
//
//Input: [0,1,0,3,12]
//Output: [1,3,12,0,0]
//Note:
//
//You must do this in-place without making a copy of the array.
//Minimize the total number of operations.

func moveZeroes(_ nums: inout [Int]) {
    guard nums.count > 0 else { return }
    guard nums.count != 1 else { return }
    
    var i = 0
    let j = 1
    
    for j in j...nums.count - 1 {
        if nums[i] == 0 {
            if nums[j] != 0 {
                //nums.swapAt(i, j)
                let temp = nums[i]
                nums[i] = nums[j]
                nums[j] = temp
                i += 1
            }
        } else if nums[i] != 0 {
            i += 1
        }
    }
    print(nums)
}
var input2 = [0,1,0,3,12]
moveZeroes(&input2)

//Given an array of strings, group anagrams together.
//
//Example:
//
//Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
//Output:
//[
//  ["ate","eat","tea"],
//  ["nat","tan"],
//  ["bat"]
//]
//func groupAnagrams(_ strs: [String]) -> [[String]] {
//    var groups = [[String]]()
//
//    for word in strs {
//
//    }
//}
