import UIKit

//https://leetcode.com/problems/combinations/
//Given two integers n and k, return all possible combinations of k numbers out of 1...n.
//Example:
//Input: n = 4, k = 2
//Output:
//[
//  [2,4],
//  [3,4],
//  [2,3],
//  [1,2],
//  [1,3],
//  [1,4],
//]
func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var matrix = [[Int]]()
    
    guard n > 0, k > 0, n >= k else {
        return matrix
    }
    
    var num = n
    
    while num > 0 {
        if k == 1 {
            matrix.append([num])
        } else {
            for number in combine(num-1, k-1) {
                matrix.append([num] + number)
                print(matrix)
            }
        }
        num -= 1
    }
    return matrix
}
combine(4, 2)
