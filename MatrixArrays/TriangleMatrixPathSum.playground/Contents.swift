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
    var i = 0
    var result = Int()
    
    while currentIndex < triangle.count && i < 3 {
        
        let smallest = smallestValue(triangle[currentIndex], value: 0, index: i)
        print(smallest)
        result += smallest
        currentIndex += 1
    }
    return result
}
func smallestValue(_ array: [Int], value: Int, index: Int) -> Int {
    if array.count == 1 {
        return array[0]
    }
    if array[index] > value {
        return array[index + 1]
    } else {
        return array[index]
    }
}
var triangle = [
    [2],
    [3,4],
    [6,5,7],
    [4,1,8,3]
]
minimumTotal(triangle) //11
var second = [[-1],[2,3],[1,-1,-3]] //-1
minimumTotal(second)
