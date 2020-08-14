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
                }
            } else if char.isLetter {
                letter += String(char)
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
//leetcode solution
func decodeString2(_ s: String ) -> String {
    var result: String = ""
    let arr = Array(s)
    // track "[","]"
    var pstack: [Character] = []
    // k values
    var kstack: [Int] = []
    // strings
    var sstack: [String] = []
    var start = 0
    
    while start < arr.count {
        let elem = arr[start]
        // generate full number and append to kstack
        if elem >= "0" && elem <= "9" {
            var v = 0
            while arr[start] >= "0" && arr[start] <= "9", let k = Int(String(arr[start])) {
                v *= 10
                v += k
                
                start += 1
            }
            start -= 1
            
            kstack.append(v)
        }
        else if elem == "[" {
            pstack.append(elem)
            sstack.append("")
        }
        // time to process sstack last value according to k
        else if elem == "]" {
            pstack.removeLast()
            let k = kstack.removeLast()
            let val = sstack.removeLast()
            var str = ""
            for _ in 0..<k {
                str.append(val)
            }
            
            if !sstack.isEmpty {
                var top = sstack.removeLast()
                top.append(str)
                sstack.append(top)
            } else {
                result.append(str)
            }
        }
        // alphabets
        else {
            if sstack.count > 0 {
                sstack[sstack.count-1].append(elem)
            } else {
                result.append(elem)
            }
        }
        
        start += 1
    }
    
    return result
}
