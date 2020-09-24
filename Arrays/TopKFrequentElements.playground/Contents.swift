import UIKit

//https://leetcode.com/problems/top-k-frequent-elements/

//Example 1:
//Input: nums = [1,1,1,2,2,3], k = 2
//Output: [1,2]

//Example 2:
//Input: nums = [1], k = 1
//Output: [1]
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    //1. convert array to frequency dictionary
    //2. return first k values sorted descending
    var dict = [Int: Int]()
    
    for num in nums {
        if let value = dict[num] {
            dict[num] = value + 1
        } else {
            dict[num] = 1
        }
    }
    
    var results = [Int]()
    var count = k
    
    for (key, _) in dict.sorted(by: {$0.value > $1.value}) {
        if count > 0 {
            results.append(key)
            count -= 1
        }
    }
    
    return results
}
topKFrequent([1,1,1,2,2,3], 2)
topKFrequent([1], 1)
