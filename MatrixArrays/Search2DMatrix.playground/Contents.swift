import UIKit
//Matrix problems
func countNegatives(_ grid: [[Int]]) -> Int {
    var flat = grid.flatMap {$0}
    flat = flat.filter {$0 < 0}
    return flat.count
}
countNegatives([[4,3,2,-1], [3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]])

//https://leetcode.com/problems/search-a-2d-matrix/
//Example 1:
//
//Input:
//matrix = [
//  [1,   3,  5,  7],
//  [10, 11, 16, 20],
//  [23, 30, 34, 50]
//]
//target = 3
//Output: true
//Example 2:
//
//Input:
//matrix = [
//  [1,   3,  5,  7],
//  [10, 11, 16, 20],
//  [23, 30, 34, 50]
//]
//target = 13
//Output: false
func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let flat = matrix.flatMap {$0}
    let middleIndex = flat.count / 2
    
    guard !flat.isEmpty else {
        return false
    }
    guard flat.first ?? 0 <= flat.last ?? 0 else {
        return false
    }
    
    if flat[middleIndex] == target {
        return true
    } else if flat[middleIndex] > target {
        return searchArray(flat, target, 0..<middleIndex)
    } else if flat[middleIndex] < target {
        return searchArray(flat, target, middleIndex + 1..<flat.count)
    } else {
        return false
    }
}
func searchArray(_ array: [Int], _ target: Int, _ range: Range <Int>) -> Bool {
    guard !array.isEmpty else {
        return false
    }
    if range.lowerBound >= range.upperBound {
        return false
    }
    let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    if array[middleIndex] == target {
        return true
    } else if array[middleIndex] > target {
        return searchArray(array, target, range.lowerBound..<middleIndex)
    } else if array[middleIndex] < target {
        return searchArray(array, target, middleIndex + 1..<range.upperBound)
    } else {
         return false
    }
}
let matrix = [
  [1, 3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
]
let matrix2 = [[1]]
searchMatrix(matrix2, 1)
