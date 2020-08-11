import UIKit

//1. Write a recursive function reverseSentence that receives a sentence and returns the sentence in reverse order. Assume the sentence doesn't have any punctuation or special characters.


func reverseSentence(sentence: String) -> String {
    guard !sentence.isEmpty else {
        return ""
    }
    var array = sentence.components(separatedBy: " ")
    
    guard !array.isEmpty else {
        return ""
    }
    
    let last = array.popLast() ?? ""
    
    if sentence.isEmpty {
        return last
    } else {
        return last + " " + reverseSentence(sentence: array[0...].joined(separator: " "))
    }
    
}

let sentence = "Hello my name is Casandra"
let result = reverseSentence(sentence: sentence)
print("results: \(result)")

//2. Given a non-negative integer n, print the first n rows of pascal's triangle.
//Pascal's triangle is a triangle in which each cell is the sum of the 2 cells above it.

func pascalsTriangle(num: Int) {
    var array = [Int]()
    var matrix = [[Int]]()
    
    if num > 0 {
        matrix.count == num
    }
    
    for (index, arr) in matrix.enumerated() {
        array = arr
        array.count == index
        if array.count == 1 {
            array.append(1)
        }
        if array.count > 1 {
            array.insert(1, at: 0)
            
            array.insert(1, at: array.count - 1)
        }
    }
}

//3. Given a string, return a comma separated string that contains the counts of each character in a row.
//Input: "abccdacc" Output: "1a, 1b, 2c, 1d, 1a, 2c"
func letterNumber(string: String) -> String {
    let letters = string.components(separatedBy: "") //[a,b,c,c,d,a,c,c ]
    let index = letters.count - 1 / 2
    
    var side1 = letters[...index] //[a,b,c,c]
    var side2 = letters[index + 1..<letters.count - 1] //[d,a,c,c]
    
    var count = 0
    
    for (index, letter) in side1.enumerated() {
        count += 1
        side1.insert(count.description, at: index)
    }
    
    return side1.joined(separator: " ")
}

var input = "abccdacc"
//print(letterNumber(string: input))

//4. Write a func that takes in a pattern: "aba" and words and returns whether the words appear in the order of the pattern.
func pattern(pattern: String, sentence: String) -> Bool {
    let array = sentence.components(separatedBy: " ")
    let patternArray = Array(pattern)
    var dick = [Character: String]()
    
    for index in 0...patternArray.count - 1 {
        if dick[patternArray[index]] == nil {
            dick[patternArray[index]] = array[index]
            print(dick)
        } else {
            if dick[patternArray[index]] != array[index] {
                return false
            }
        }
    }
    return true
}
var sentence1 = "apple banana apple"
var pattern = "121"
print(pattern(pattern: pattern, sentence: sentence1))

//5. Given a non-empty array of integers, every element appears twice except for one. Find that single one.

func singleNumber(_ nums: [Int]) -> Int {
    var dict = [Int: Int]()
    let count = 1
    
    for num in nums {
        if dict[num] == nil {
            dict[num] = count
        } else {
            dict[num] = nil
        }
    }
    
    return dict.first!.key
}

print(singleNumber([1,2,2,3,3]))

//6. Given an array of at least three integers, return the largest product you can get by multiplying three numbers together.
// ex: [3, 5, 1, 2, 8] = 120
func largestProduct(array: [Int]) -> Int {
    guard array.count > 0 else {return 0}
    var a = Int()
    var b = Int()
    var c = Int()
    
    for num in array {
        if num < 0 {
            let postive = -(num)
            print("negative: \(a)")
            if postive > a {
                c = b
                b = a
                a = postive
            }  else if postive > b && postive < a {
                c = b
                b = postive
                print("b \(b), c \(c)")
            } else if postive < b && postive > c {
                c = postive
                print("c \(c)")
            }
        } else if num >= a {
            c = b
            b = a
            a = num
            print("a \(a), b \(b), c \(c)")
        } else if num < a && num >= b {
            c = b
            b = num
            print("b \(b), c \(c)")
        } else if num < b && num >= c {
            c = num
            print("c \(c)")
        }
    }
    return a*b*c
}
print(largestProduct(array: [3,5,1,2,8]))
print(largestProduct(array: [-10, -4, 2, 3, 5]))
print(largestProduct(array: [-13, 14, 12, 10, 2]))
