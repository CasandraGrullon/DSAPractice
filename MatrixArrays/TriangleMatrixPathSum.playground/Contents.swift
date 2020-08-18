import UIKit

//https://leetcode.com/problems/triangle/
//Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.
//For example, given the following triangle
//[
//     [2],
//    [3,4],
//   [6,5,7],
//  [4,1,8,3]
//]
//The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11)

func minimumTotal(_ triangle: [[Int]]) -> Int {
    guard triangle.count > 0 else {
        return 0
    }
    var currentIndex = 0
    var result = Int()
    
    while currentIndex < triangle.count {
        let smallest = smallestValue(triangle[currentIndex])
        result += smallest
        currentIndex += 1
    }
    return result
}
func smallestValue(_ array: [Int]) -> Int {
    let sorted = array.sorted()
    return sorted[0]
}
var triangle = [
    [2],
    [3,4],
    [6,5,7],
    [4,1,8,3]
]
//minimumTotal(triangle)
var second = [[-1],[2,3],[1,-1,-3]] //this should be -2 but leetcode is saying it should be -1....
minimumTotal(second)
