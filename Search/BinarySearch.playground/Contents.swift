import UIKit

// Binary Search - implemented using recursion
// runtime: O(log n) --> because we split the array at each pass until element is found
// Using divide and conquer

//  STEPS
// 1. Sort array (assuming the array is sorted. if it isn't sorted you need to create a helper function to sort the array first)

// 2. Split array in half using the middle index

// 3. Based on the value we are looking for, if the value is less than the middle index value we search on its left side.
//  if it's greater than the middle then we search on the right side.

// 4. Continue to split array until the value is found


//return the index number
func binarySearch<T: Comparable>(_ array: [T], searchKey: T, range: Range<Int>) -> Int? {
    
    //check to ensure that the upperBound (last element in the array) is higher than the lowerBound (first element in the array)
    if range.lowerBound >= range.upperBound {
        return nil
    }
    
    //calculate middle index
    let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    // Checklist:
    // 1. is the middle index value equal to the searchKey (if true, return value)
    // 2. if the value at the middle index is > than the search key, look to at the left side
    // 3. else, look at the right side
    
    //Check 1
    if array[middleIndex] == searchKey {
        return middleIndex
    }
    //Check 2
    else if array[middleIndex] > searchKey {
        //using recursion.
        //we could do this iteravely by using a while loop
        return binarySearch(array, searchKey: searchKey, range: range.lowerBound..<middleIndex) //range checks first element to the middle index, not including the middle index
    }
    //Check 3
    else if array[middleIndex] < searchKey {
        return binarySearch(array, searchKey: searchKey, range: middleIndex + 1..<range.upperBound)
    }
    
    //if the searchKey was never found
    return nil
}

let list = [2, 6, 9, 13, 34, 99, 101]

let index = binarySearch(list, searchKey: 99, range: (0..<list.count))

print("index of 99 is \(index ?? 0)") //5

let characters = ["apple", "bird", "dog", "egg"]

let characterSearch = binarySearch(characters, searchKey: "dog", range: (0..<characters.count))
print("index of dog is \(characterSearch ?? 0)")
