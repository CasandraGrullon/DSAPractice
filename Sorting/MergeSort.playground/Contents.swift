import UIKit

// Merge Sort
// runtime: O(n log n) ---> for worst, best and average time
// space: O(n)
// Uses divide and conquer algorithm to split array into multiple arrays unil count/ base case for each array is 1
// Merges arrays in sorted order by comparing left array to the right array elements

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    //1. guard that base case is greater than 1 --> making sure our array has more than one element
    guard array.count > 1 else {
        return array
    }
    //2. split array in half
    let middleIndex = array.count / 2
    //3. make left and right side arrays from the middleIndex
    let leftArray = mergeSort(Array(array[..<middleIndex])) //creating a new array from the beginning of the array to its center.
    let rightArray = mergeSort(Array(array[middleIndex...])) //creating a new array from the center to the end of the array
    
    
    
    return merge(leftArray, rightArray)
}
//helper function to combine two sorted arrays
func merge<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var resultsArray = [T]() // this is why merge sort space is not constant!
    
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        let leftElement = leftArray[leftIndex]
        let rightElement = rightArray[rightIndex]
        
        //compare and append smaller element
        if leftElement < rightElement { //append left
            resultsArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement { //append right
            resultsArray.append(rightElement)
            rightIndex += 1
        } else { //both equal, append both
            resultsArray.append(leftElement)
            leftIndex += 1
            resultsArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    // outside of while loop, append remaining elements in either arrays (usually happens with an odd number array count)
    // only works if two arrays are sorted
    if leftIndex < leftArray.count {
        resultsArray.append(contentsOf: leftArray[leftIndex...]) // contents of will append more than one value in a sequence
    }
    if rightIndex < rightArray.count {
        resultsArray.append(contentsOf: rightArray[rightIndex...])
    }
    
    return resultsArray
}

let list = [12, 8, 29, -100, 0, 234]
let sortedList = mergeSort(list) //[-100, 0, 8, 12, 29, 234]
print(sortedList)
