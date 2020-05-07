import UIKit

func search(_ nums: [Int], _ target: Int) -> Int {
    let range: Range<Int> = 0..<nums.count
    return binarySearch(nums, searchKey: target, range: range) ?? -1
}
func binarySearch<T: Comparable>(_ array: [T], searchKey: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        return nil
    }

    let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2

    if array[middleIndex] == searchKey {
        return middleIndex
    }

    else if array[middleIndex] > searchKey {

        return binarySearch(array, searchKey: searchKey, range: range.lowerBound..<middleIndex)
    }
    
    else if array[middleIndex] < searchKey {
        return binarySearch(array, searchKey: searchKey, range: middleIndex + 1..<range.upperBound)
    }
    
    return nil
}
var nums = [-1,0,3,5,9,12]
var target = 9
search(nums, target)
//Output: 4
