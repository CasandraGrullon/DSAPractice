import UIKit

//https://leetcode.com/problems/find-all-duplicates-in-an-array/
func findDuplicates(_ nums: [Int]) -> [Int] {
    var dict = [Int: Int]()
    var results = [Int]()
    
    for num in nums {
        if let value = dict[num] {
            dict[num] = value + 1
        } else {
            dict[num] = 1
        }
    }
    for (key, value) in dict {
        if value == 2 {
            results.append(key)
        }
    }
    return results
}
findDuplicates([4,3,2,7,8,2,3,1])
findDuplicates([4,1,4,1,1])
