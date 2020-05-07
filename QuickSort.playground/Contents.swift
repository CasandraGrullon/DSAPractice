import UIKit

//  Quick Sort runtime: O(n log n)

// Quick Sort using Lomuto's Partioning algorithm ===> the last element of the array is the pivot
// Quick Sort is a "divide and conquer" meaning we are splitting the array from the left side and the right side of the pivot
//  Use recursive call to split array until the array is fully sorted


//return an index that we will use as the pivot to split the array
func lomutoPartition<T: Comparable>(_ arr: inout [T], low: Int, high: Int) -> Int {
    //low and high are indexes!!!
    let pivot = arr[high]
    var i = low // refers to the first index of the array
    
    // iterate through the array using j variable as our marker
    for j in low..<high {
        if arr[j] <= pivot {
            //swap and increment i
            arr.swapAt(i, j)
            i += 1
        }
    }
    // by the end of the loop, i will be the last element sorted
    arr.swapAt(i, high)
    return i // now the last element of the array
}
//now we do a quick sort using previous func 
func quickSortLomuto<T: Comparable>(_ arr: inout [T], low: Int, high: Int) {
    // if we just started the array, low should be index 0, so we split the array until this isn't true
    if low < high {
        //1. get a new pivot if low is less than high
        let pivot = lomutoPartition(&arr, low: low, high: high)
        
        //2. recursive calls to split the main array to two seperate arrays: left array and right array
        
        // left array (not sorted values)
        quickSortLomuto(&arr, low: low, high: pivot - 1)
        
        //right array (already sorted values)
        quickSortLomuto(&arr, low: pivot + 1, high: high)
    }
}

var array = [80, 10, -9, 0, -11, 13, 90, -8, 1, -90, 11, 25, 80, -9, 10, 8, -7]

quickSortLomuto(&array, low: 0, high: array.count - 1)
print(array)

//bubble sort (WORST! GROSS! NO BUENO!)
func bubbleSort(_ array: inout [Int]) {
    for _ in 0..<array.count {
        for j in 1..<array.count {
            if array[j] < array[j-1] {
                array.swapAt(j, j-1)
            }
        }
    }
}

var bubble = [80, 10, -9, 0, -11, 13, 90, -8, 1, -90, 11, 25, 80, -9, 10, 8, -7]
bubbleSort(&bubble)
print(bubble)
