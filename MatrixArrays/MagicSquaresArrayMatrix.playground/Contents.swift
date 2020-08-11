import UIKit

//https://leetcode.com/problems/magic-squares-in-grid/

//Magic Squares In Grid
//A 3 x 3 magic square is a 3 x 3 grid filled with distinct numbers from 1 to 9 such that each row, column, and both diagonals all have the same sum.
//Given an grid of integers, how many 3 x 3 "magic square" subgrids are there?  (Each subgrid is contiguous).
//Example 1:
//Input: [[4,3,8,4],
//        [9,5,1,9],
//        [2,7,6,2]]
//Output: 1
//Explanation:
//The following subgrid is a 3 x 3 magic square:
//438
//951
//276
//
//while this one is not:
//384
//519
//762
//In total, there is only one magic square inside the given grid.

func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
    //var results = [Int]()
    var results = [Int]()
    var count = 0
    var totalSum = 0
    let magicSum = 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9
    
    //1. iterate through each subarray
    //2. append each unique number to array
    //3. append results array to matrix
    //4. return matrix.count
    
    for array in grid {
        for number in array {
            if !results.contains(number) {
                results.append(number)
            }
        }
    }
    
    for number in results {
        totalSum += number
    }
    if totalSum == magicSum {
        count += 1
    } else {
        return 0
    }
    return count
}

let input = [[4,3,8,4],[9,5,1,9],[2,7,6,2]] // 1
numMagicSquaresInside(input)
let input2 = [[4,3,8,4,3,8],[9,5,1,9,5,1],[2,7,6,2,7,6]]//2
