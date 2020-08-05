import UIKit

//https://leetcode.com/problems/reverse-pairs/

//Input: [1,3,2,3,1]
//Output: 2

//leetcode solution
func reversePairsLC(_ nums: [Int]) -> Int {
    var helper = [Int](repeatElement(0, count: nums.count))
    var nums = nums
    
    return mergeSortLC(0, nums.count - 1, &nums, &helper)
}

private func mergeSortLC(_ start: Int, _ end: Int, _ nums: inout [Int], _ helper: inout [Int]) -> Int {
    if start >= end {
        return 0
    }
    
    let middle = start + (end - start) / 2
    var count = mergeSortLC(start, middle, &nums, &helper) + mergeSortLC(middle + 1, end, &nums, &helper)
    var j = middle + 1
    
    for i in start...middle {
        while j <= end && Double(nums[i]) / 2.0 > Double(nums[j]) {
            j += 1
        }
        count += j - (middle + 1)
    }
    
    mergeHelperLC(start, middle, end, &nums, &helper)
    
    return count
}

private func mergeHelperLC(_ start: Int, _ middle: Int, _ end: Int, _ nums: inout [Int], _ helper: inout [Int]) {
    for i in start...end {
        helper[i] = nums[i]
    }
    
    var n1 = start
    var n2 = middle + 1
    var i = start
    
    while n1 <= middle || n2 <= end {
        if n1 > middle || (n2 <= end && helper[n1] >= helper[n2]) {
            nums[i] = helper[n2]
            i += 1
            n2 += 1
        } else {
            nums[i] = helper[n1]
            i += 1
            n1 += 1
        }
    }
}

//my solution
func reversePairs(_ nums: [Int]) -> Int {
    let sortedArray = mergeSort(nums)
    
    var count = 0
    var i = 0
    let middle = nums.count / 2
    var j = i + 1
    
    for index in 0...middle {
        while j <= sortedArray.count && sortedArray[i] > (sortedArray[j] * 2) {
            i += 1
            j += 1
        }
        count += 1
    }
    
    return count
}
func merge(_ leftArray: [Int], rightArray:[Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var resultsArray = [Int]()
    
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        let leftElement = leftArray[leftIndex]
        let rightElement = rightArray[rightIndex]
        
        if leftElement < rightElement {
            resultsArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            resultsArray.append(rightElement)
            rightIndex += 1
        } else {
            resultsArray.append(leftElement)
            leftIndex += 1
            resultsArray.append(rightElement)
            rightIndex += 1
        }
    }
    if leftIndex < leftArray.count {
        resultsArray.append(contentsOf: leftArray[leftIndex...])
    }
    if rightIndex < rightArray.count {
        resultsArray.append(contentsOf: rightArray[rightIndex...])
    }
    
    return resultsArray
}
func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {return array}
    
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex...]))
    
    return merge(leftArray, rightArray: rightArray)
}
let nums = [2,4,3,5,1]
print(reversePairs(nums)) // 3
let nums2 = [1,3,2,3,1]
print(reversePairs(nums2)) // 2
