import UIKit

//https://leetcode.com/problems/reformat-the-string/
//Input: s = "a0b1c2"
//Output: "0a1b2c"
//Explanation: No two adjacent characters have the same type in "0a1b2c". "a0b1c2", "0a1b2c", "0c2a1b" are also valid permutations.
//Example 2:
//
//Input: s = "leetcode"
//Output: ""
//Explanation: "leetcode" has only characters so we cannot separate them by digits.
//Example 3:
//
//Input: s = "1229857369"
//Output: ""
//Explanation: "1229857369" has only digits so we cannot separate them by characters.
//Example 4:
//
//Input: s = "covid2019"
//Output: "c2o0v1i9d"

func reformat(_ s: String) -> String {
    var letterArray = [String]()
    var numberArray = [String]()
    var result = [String]()
    
    guard s.count > 1 else {
        return s
    }
    
    for char in s {
        if char.isNumber {
            numberArray.append(String(char))
        } else {
            letterArray.append(String(char))
        }
    }
    guard !letterArray.isEmpty && !numberArray.isEmpty else {
        return ""
    }
    
    result = mergeArrays(a: letterArray, b: numberArray)
    return result.joined()
}
func mergeArrays(a: [String], b: [String]) -> [String] {
    var letterArray = a
    var numberArray = b
    var result = [String]()
    
    if letterArray.count > numberArray.count {
        while !letterArray.isEmpty && !numberArray.isEmpty {
            if let letter = letterArray.first, let number = numberArray.first {
                if result.isEmpty {
                    result.append(String(letter))
                    letterArray.removeFirst()
                } else {
                    let string = "\(number)\(letter)"
                    result.append(string)
                    letterArray.removeFirst()
                    numberArray.removeFirst()
                }
            }
        }
    } else {
        while !letterArray.isEmpty && !numberArray.isEmpty {
            if let letter = letterArray.first, let number = numberArray.first {
                let string = "\(number)\(letter)"
                result.append(string)
                letterArray.removeFirst()
                numberArray.removeFirst()
            }
        }
        if !numberArray.isEmpty {
            result.append(contentsOf: numberArray)
        }
    }
    return result
}
reformat("a0b1c2")
reformat("123456")
reformat("covid2019")//"c2o0v1i9d"
reformat("ab123")
