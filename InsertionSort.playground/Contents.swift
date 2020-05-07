import UIKit

// sorting algorithms:
// O(n^2) slower (bubble sort, insertion sort)
// O(n log n) faster (merge sort, quick sort)

// Insertion Sort
// runtime: O(n^2)
// space: O(1) because it sorts in place
// slightly better performance than bubble sort
// best use is when there is a partially sorted or a small array, avoid other wise

// swift's .sorted built in algorithm (runtime: n log n) uses insertion sort on small, partially sorted arrays

func insertionSort<T: Comparable>(_ arr: inout [T] ) {
    guard arr.count >= 2 else {return}
    for current in 1..<arr.count {
        for j in (1...current).reversed() { // .reversed allows us to look at the value before j
            if arr[j] < arr[j-1] { //means it's not sorted
                arr.swapAt(j, j-1)
            } else { //means the left side is sorted
                break // means continue to outer loop
            }
        }
    }
}

var list = [4,5,5,-2]
insertionSort(&list)
print(list)
