import UIKit

//https://leetcode.com/problems/reshape-the-matrix/
//Input:
//nums =
//[[1,2],
// [3,4]]
//r = 1, c = 4
//Output:
//[[1,2,3,4]]
//Explanation:
//The row-traversing of nums is [1,2,3,4]. The new reshaped matrix is a 1 * 4 matrix, fill it row by row by using the previous list.

func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
    var flatArray = nums.flatMap {$0}
    var results = [[Int]]()
    guard flatArray.count >= r * c else {
        return nums
    }
    
    if flatArray.count == c {
        return [flatArray]
    } else {
        var currentRow = 0
        let currentRange = 0..<c
        while currentRow < r {
            let subArray = makeMatrix(array: flatArray, rows: currentRow, range: currentRange)
            results.append(subArray)
            flatArray.removeSubrange(currentRange)
            currentRow += 1
        }
    }
    return results
}
func makeMatrix(array: [Int], rows: Int, range: Range<Int>) -> [Int] {
    var subArray = [Int]()
    
    subArray.append(contentsOf: array[range])
    
    return subArray
}
var input = [[1,2,3,4]]
print(matrixReshape(input, 2, 2))
