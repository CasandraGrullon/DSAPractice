import UIKit

//https://leetcode.com/problems/sort-colors/
//Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.
//Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
//Input: [2,0,2,1,1,0]
//Output: [0,0,1,1,2,2]

func sortColors(_ nums: inout [Int]) {
    quickSort(&nums, low: 0, high: nums.count - 1)
}
func lomutoPartition(_ array: inout [Int], low: Int, high: Int) -> Int {
    let pivot = array[high]
    var i = low
    
    for j in low..<high {
        if array[j] <= pivot {
            array.swapAt(i, j)
            i += 1
        }
    }
    
    array.swapAt(i, high)
    return i
}
func quickSort(_ array: inout[Int], low: Int, high: Int) {
    if low < high {
        let pivot = lomutoPartition(&array, low: low, high: high)
        quickSort(&array, low: low, high: pivot - 1)
        quickSort(&array, low: pivot + 1, high: high)
    }
}
var input = [2,0,2,1,1,0]
sortColors(&input)
