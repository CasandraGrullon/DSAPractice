import UIKit

//https://leetcode.com/problems/how-many-numbers-are-smaller-than-the-current-number/
// How Many Numbers Are Smaller Than the Current Number
// input = [8,1,2,2,3]
// output = [4,0,1,1,3] ---> 4 nums are smaller than 8, 0 nums are smaller than 1, etc
func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
    var resultsArray = [Int]()
    var numsCopy = nums
    var count = 0
    var index = 0
    

    
    
    
    return resultsArray
}
func makeDictionary(_ nums: [Int]) -> [Int: Int] {
    var dict = [Int: Int]()
    for num in nums {
        if dict[num] != nil {
            dict[num] = 0
        } else {
            dict[num] = 0
        }
    }
    return dict
}
var input = [8,1,2,2,3] //expected: [4,0,1,1,3]
smallerNumbersThanCurrent(input)

//https://leetcode.com/problems/flipping-an-image/

//Given a binary matrix A, we want to flip the image horizontally, then invert it, and return the resulting image.

//To flip an image horizontally means that each row of the image is reversed.  For example, flipping [1, 1, 0] horizontally results in [0, 1, 1].

//To invert an image means that each 0 is replaced by 1, and each 1 is replaced by 0. For example, inverting [0, 1, 1] results in [1, 0, 0].


//Input: [[1,1,0],[1,0,1],[0,0,0]]
//Output: [[1,0,0],[0,1,0],[1,1,1]]
//Explanation: First reverse each row: [[0,1,1],[1,0,1],[0,0,0]].
//Then, invert the image: [[1,0,0],[0,1,0],[1,1,1]]

func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
    //1. take each array and reverse them
    var matrix1 = [[Int]]()
    var resultArray = [[Int]]()
    
    for array in A {
        let arrayCopy = reverseArray(array: array)
        matrix1.append(arrayCopy)
        print(matrix1)
    }
    //2. make all the 0's in the array = 1 and vice versa
    for array in matrix1 {
        let newArray = flip(array: array)
        resultArray.append(newArray)
    }
    return resultArray
}
func reverseArray(array: [Int]) -> [Int] {
    var copy = array
    var resultArray = [Int]()
    
    while !copy.isEmpty {
        let current = copy.removeLast()
        resultArray.append(current)
    }
    
    return resultArray
}
func flip(array: [Int]) -> [Int] {
    var results = [Int]()
    for num in array {
        if num == 0 {
            results.append(1)
        } else if num == 1 {
            results.append(0)
        }
    }
    return results
}
var input1 = [[1,1,0],[1,0,1],[0,0,0]]
//expected = [[1,0,0],[0,1,0],[1,1,1]]
flipAndInvertImage(input1)
