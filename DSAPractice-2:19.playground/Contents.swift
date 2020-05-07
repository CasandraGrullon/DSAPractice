import UIKit

//DSA Practice Questions Feb 19, 2020

//1. Determine if a given string is a palindrome (the same backwards and forwards) ignoring capitalization and punctuation.

//"Madam I'm Adam" = true
//"No lava on Avalon. No lava, no Avalon" = true
//"They're taking the Hobbits to Isengard" = false

let palindrome1 = "Madam I'm Adam"
let palindrome2 = "No lava on Avalon. No lava, no Avalon"
let palindrome3 = "They're taking the Hobbits to Isengard"

//not Big O solution :(
private func isPalidrome(for string: String) -> Bool {
    var word = String()
    var reversedWord = String()
    
    for char in string.lowercased().reversed() {
        if char.isLetter {
            reversedWord.append(char.lowercased())
        }
    }
    for char in string.lowercased() {
        if char.isLetter {
            word.append(char)
        }
    }
    if word == reversedWord {
        return true
    } else {
        return false
    }
}
isPalidrome(for: palindrome1)
isPalidrome(for: palindrome2)
isPalidrome(for: palindrome3)

//2. Determine if a given string has all the letters in the English alphabet in it.
//The quick brown fox jumps over the lazy dog = true
//Four square and seven years ago = false

let pangram1 = "The quick brown fox jumps over the lazy dog"
let pangram2 = "Four square and seven years ago"

func isPangram(for string: String) -> Bool {
    let alphabetSet: Set<Character> = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    var compareSet = Set<Character>()
    
    for char in string.lowercased() {
        if char.isLetter {
            compareSet.insert(char)
        }
    }
    if compareSet == alphabetSet {
        return true
    } else {
        return false
    }
}

isPangram(for: pangram1)
isPangram(for: pangram2)

//3. Reverse a string without using the built in reverse method.
let word = "Hello World!"

func reverse(for string: String) -> String {
    var result = String()
    
    for char in string {
        result.insert(char, at: string.startIndex)
    }
    return result
}
reverse(for: word)

//4. Find the sum of the diagonals of a square, two-dimensional array of Ints
let matrix = [[1, 2, 9],
              [8, 2, 3],
              [4, 5, 6]]

func diagnolSums(for matrix: [[Int]]) -> Int {
    var sum1 = Int()
    var sum2 = Int()
    var result = Int()
    for (index, array) in matrix.enumerated() {
        for (inx, number) in array.enumerated() {
            if index + inx == 2 {
                sum1 += number
            }
            if index == inx {
                sum2 += number
            }
        }
    }
    result = sum1 + sum2
    return result
}
diagnolSums(for: matrix)

//5. Find the sum of the first five even numbers in an array of Ints.
let arrayOfNumbers = [3,7,-3,2,9,4,8,10,3,9,4,9,8,6,-2]

func evenNumberSum(for array: [Int]) -> Int {
    var evenArray = [Int]()
    var result = Int()
    
    for number in array {
        if number % 2 == 0 {
            evenArray.append(number)
        }
    }
    result = evenArray[0] + evenArray[1] + evenArray[2] + evenArray[3] + evenArray[4]
    
    return result
}
evenNumberSum(for: arrayOfNumbers)

//8. Given an array of integers, find the second largest integer.

let array = [1, 4, -2, -9, 2, 5, -1, 10, 4]

func secondBiggest(for array: [Int]) -> Int {
    var largestNum = 0
    var second = 0
    for num in array {
        if num > largestNum {
            largestNum = num
        }
        
        
    }
    return second
}
secondBiggest(for: array)
var largestNum = 0
var second = 0
for (index, num) in array.enumerated() {
    if num > largestNum {
        largestNum = num
        
    }
    
    
}
