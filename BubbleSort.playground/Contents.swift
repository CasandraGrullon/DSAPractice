import UIKit

// Bubble Sort
// sorting algorithm
// runtime: O(n ^ 2) -> Quadratic (the WORST sorting algorithm)
// space complexity: O(1) -> Constant -> because it sorts in place
// sorts in place ==> * inout * function (does not return a new object, instead it will manipulate a reference of the object passed in and change the value of it)

func bubbleSort<T: Comparable>(_ array: inout [T] ) { //inout indicates in place manipulation
    
    for _ in 0..<array.count { // this loop starts at position 1 of array == O(n)
        for j in 1..<array.count { // j starts at positon 2 of array == O(n) ---> together both loops are O(n^2)
            if array[ j ] < array[ j - 1 ] {
                //swap values
                let temp = array[ j ] // saving j's value before its overwritten
                array[j] = array[ j - 1 ]
                array[ j - 1 ] = temp
                //print("j= \(array[j]) j-1= \(array[j-1]) array= \(array)")
            }
        }
    }
}

var list = [10, 2, -8, 4]
bubbleSort( &list ) //inout symbol == &
print(list)
