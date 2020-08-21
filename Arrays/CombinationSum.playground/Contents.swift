import UIKit


//https://leetcode.com/problems/combination-sum/

//Example 1:
//Input: candidates = [2,3,6,7], target = 7,
//A solution set is:
//[
//  [7],
//  [2,2,3]
//]

//Example 2:
//Input: candidates = [2,3,5], target = 8,
//A solution set is:
//[
//  [2,2,2,2],
//  [2,3,3],
//  [3,5]
//]

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var output = [[Int]]()
    let set = Set(candidates)
    var sum = 0
    
    if set.contains(target) {
        output.append([target])
    }
    for num in set {
        
    }
    
    
    return output
}

combinationSum([2,3,6,7], 7)
combinationSum([2,3,5], 8)
