import UIKit

//https://leetcode.com/problems/toeplitz-matrix/
//A matrix is Toeplitz if every diagonal from top-left to bottom-right has the same element.
//Now given an M x N matrix, return True if and only if the matrix is Toeplitz.
//Example 1:
//Input:
//matrix = [
//  [1,2,3,4],
//  [5,1,2,3],
//  [9,5,1,2]
//]
//Output: True
//Explanation:
//In the above grid, the diagonals are:
//"[9]", "[5, 5]", "[1, 1, 1]", "[2, 2, 2]", "[3, 3]", "[4]".
//In each diagonal all elements are the same, so the answer is True.
//Example 2:
//
//Input:
//matrix = [
//  [1,2],
//  [2,2]
//]
//Output: False
//Explanation:
//The diagonal "[1, 2]" has different elements.

//431 / 482 test cases
func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
    if matrix.count == 0 {
        return true
    }
    
    for (index, array) in matrix.enumerated() {
        for (i, _) in array.enumerated() {
            if diagnol(row: index, col: i, matrix: matrix) == false {
                return false
            }
        }
    }
    return true
}
func diagnol(row: Int, col: Int, matrix: [[Int]]) -> Bool {
    var row = row
    var col = col
    var num: Int?
    
    while row < matrix.count && col < matrix[0].count {
        if let num = num {
            if num != matrix[row][col] {
                return false
            }
        } else {
            num = matrix[row][col]
            print(num!)
        }
        
        row += 1
        col += 1
    }
    return true
}

var matrix = [
  [1,2,3,4],
  [5,1,2,3],
  [9,5,1,2]
]
isToeplitzMatrix(matrix)

var matrix2 =
[[11,74,0,93],[40,11,74,7]] // false
isToeplitzMatrix(matrix2)
