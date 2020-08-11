import UIKit

//https://leetcode.com/problems/first-unique-character-in-a-string/

//Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.

//Examples:
//s = "leetcode"
//return 0 ("l" is the first non-repeating character)

//s = "loveleetcode",
//return 2 ("v" is the first non-repeating character)
func firstUniqChar(_ s: String) -> Int {
    var dict = [Character: Int]()
    
    for char in s {
        if let value = dict[char] {
            dict[char] = value + 1
        } else {
            dict[char] = 1
        }
    }
    
    for (index,char) in s.enumerated() {
        if dict[char] == 1 {
            return index
        }
    }
    return -1
}
var sample1 = "leetcode"
firstUniqChar(sample1)
var sample2 = "loveleetcode"
firstUniqChar(sample2)
