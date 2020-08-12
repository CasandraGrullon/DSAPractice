import UIKit

//https://leetcode.com/problems/decode-string/
//Example 1:
//Input: s = "3[a]2[bc]"
//Output: "aaabcbc"

//Example 2:
//Input: s = "3[a2[c]]"
//Output: "accaccacc"

func decodeString(_ s: String) -> String {
    let letters = s.components(separatedBy: "]")
    var current = 0
    var newStrings = [String]()
    var letter = String()
    var number = 0
    
    while current < letters.count {
        let currentString = letters[current]
        for char in currentString {
            if char.isNumber {
                if let num = Int(String(char)) {
                    number = num
                    print(number)
                }
            } else if char.isLetter {
                letter += String(char)
                print(letter)
            }
        }
        newStrings.append(String(repeating: letter, count: number))
        letter = String()
        number = 0
        current += 1
    }
    return newStrings.joined()
}
func createArray(char: Character, count: Int) -> [String] {
    var result = [String]()
    if char.isLetter {
        result = Array(repeating: String(char), count: count)
    }
    return result
}
//decodeString("3[a]2[bc]")//"aaabcbc"
decodeString("3[a2[c]]")//"accaccacc"
