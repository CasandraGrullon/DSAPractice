import UIKit

//https://leetcode.com/problems/string-to-integer-atoi/
//Example 1:
//Input: "42"
//Output: 42
//Input: "4193 with words"
//Output: 4193

//leetcode solution
func myAtoi(_ str: String) -> Int {
    if isValidString(s: str) == false {
        return 0
    }
    var result = 0
    var onlyDigit = false
    var sign = 1
    
    for char in str {
        switch char {
        case " ":
            if onlyDigit {
                return result
            } else {
                continue
            }
        case "+":
            if onlyDigit {
                return result
            } else {
               onlyDigit = true
                sign = 1
            }
            
        case "-":
            if onlyDigit {
                return result
            } else {
                onlyDigit = true
                sign = -1
            }
        case "0"..."9":
            if let number = Int(String(char)) {
                result = result * 10 + number * sign
                guard result <= Int32.max else {
                    return Int(Int32.max)
                }
                guard result >= Int32.min else {
                    return Int(Int32.min)
                }
                
                onlyDigit = true
            }
        default:
            return result
        }
    }
    
    return result
}

func isValidString(s: String) -> Bool {
    if s.isEmpty {
        return false
    } else if s.first!.isLetter {
        return false
    } else if s.count == 1 && s.first!.isPunctuation {
        return false
    } else {
        return true
    }
}

myAtoi("-4193 with words")//-4193
myAtoi("words and 987")//0
myAtoi("-91283472332")//-2147483648
myAtoi("3.21")//3
myAtoi("+-2")//0
myAtoi("  -42")//-42
myAtoi("-")//0
myAtoi("+1")//1
myAtoi("  +0 123")//0
