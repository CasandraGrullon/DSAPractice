import UIKit

//https://leetcode.com/problems/transpose-matrix/
//1.
//Input: [[1,2,3],[4,5,6],[7,8,9]]
//Output: [[1,4,7],[2,5,8],[3,6,9]]

//2.
//Input: [[1,2,3],[4,5,6]]
//Output: [[1,4],[2,5],[3,6]]

func transpose(_ A: [[Int]]) -> [[Int]] {
    //1. access each array in the matrix
    //2. create dictionary of [index: [nums at index]]
    //3. return values in sorted index order
    var dict = [Int: [Int]]()
    
    for (_, array) in A.enumerated() {
        for (r, num) in array.enumerated() {
            if let _ = dict[r] {
                dict[r]?.append(num)
            } else {
                dict[r] = [num]
            }
        }
    }
    return dict.sorted(by: {$0.key < $1.key}).map {$0.value}
}
transpose([[1,2,3],[4,5,6],[7,8,9]])
transpose([[1,2,3],[4,5,6]])

//https://leetcode.com/problems/search-a-2d-matrix-ii/
//[
//  [1,   4,  7, 11, 15],
//  [2,   5,  8, 12, 19],
//  [3,   6,  9, 16, 22],
//  [10, 13, 14, 17, 24],
//  [18, 21, 23, 26, 30]
//]
//Given target = 5, return true.
//
//Given target = 20, return false.

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    //1. search one subarray at a time
    //2. helper binary seach method
    
    for array in matrix {
        let targetIndex = binarySearch(array, target, range: 0..<array.count)
        if targetIndex != nil {
            return true
        }
    }
    return false
}
func binarySearch(_ array: [Int], _ target: Int, range: Range<Int>) -> Int? {
    guard range.lowerBound < range.upperBound else {
        return nil
    }
    
    let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    if array[middleIndex] == target {
        return middleIndex
    } else if array[middleIndex] > target {
        return binarySearch(array, target, range: range.lowerBound..<middleIndex)
    } else if array[middleIndex] < target {
        return binarySearch(array, target, range: middleIndex + 1 ..< range.upperBound)
    } else {
        return nil
    }
}
var matrix = [
  [1,   4,  7, 11, 15],
  [2,   5,  8, 12, 19],
  [3,   6,  9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
]
searchMatrix(matrix, 30)

//Rotate Image
//https://leetcode.com/problems/rotate-image/
//Example 1:
//Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
//Output: [[7,4,1],[8,5,2],[9,6,3]]

//Example 2:
//Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
//Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]

//Example 3:
//Input: matrix = [[1]]
//Output: [[1]]

//Example 4:
//Input: matrix = [[1,2],[3,4]]
//Output: [[3,1],[4,2]]
func rotate(_ matrix: inout [[Int]]) {
    //1. from bottom -> up
    //2. subarray values = new colums
    //ex: [[0,0],[0,1],[0,2], [1,0],[1,1],[1,2], [2,0],[2,1],[2,2]] -> [[2,0],[1,0],[0,0], [2,1],[1,1],[0,1], [2,2],[1,2],[0,2]]
    var dict = [Int: [Int]]()
    
    for (_, array) in matrix.enumerated() {
        for (r, num) in array.enumerated() {
            if let _ = dict[r] {
                dict[r]?.insert(num, at: 0)
            } else {
                dict[r] = [num]
            }
        }
    }
    matrix = dict.sorted(by: {$0.key < $1.key}).map {$0.value}
}
var matrix2 = [[1,2,3],[4,5,6],[7,8,9]]
rotate(&matrix2)
