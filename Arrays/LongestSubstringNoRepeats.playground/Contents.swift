import UIKit

//https://leetcode.com/problems/longest-substring-without-repeating-characters/
//Example 1:
//Input: s = "abcabcbb"
//Output: 3
//Explanation: The answer is "abc", with the length of 3.

//Example 2:
//Input: s = "bbbbb"
//Output: 1
//Explanation: The answer is "b", with the length of 1.

//Example 3:
//Input: s = "pwwkew"
//Output: 3
//Explanation: The answer is "wke", with the length of 3.
//Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

//Example 4:
//Input: s = ""
//Output: 0
func lengthOfLongestSubstring(_ s: String) -> Int {
//    guard s.count > 0 else {
//        return s.count
//    }
//    var sCopy = s
//
//    var charSet: Set<String> = []
//
//    while !sCopy.isEmpty {
//        let current = sCopy.removeFirst()
//        charSet.insert(String(current))
//
//        if let first = sCopy.first {
//            if current != first {
//                if !charSet.contains(String(first)) {
//                    charSet.insert(String(first))
//                    print(charSet)
//                } else {
//                    break
//                }
//            } else {
//                charSet.removeAll()//(String(current))
//            }
//        }
//
//    }
//        return charSet.count
//    let s = Array(s)
//    var recent = [Character: Int]()
//    var longest = 0
//    var result = 0
//
//    for index in s.indices {
//        longest += 1
//        let c = s[index]
//        if let prev = recent[c] {
//            let back = (index - prev)
//            if back < longest {
//                longest = back
//            }
//        }
//        recent[c] = index
//        if longest > result {
//            result = longest
//            print(result)
//        }
//    }
//    return result
//    if s.count < 2 { return s.count }
//    var dict = [Character: Int]()
//    var start = 0
//    var ans = 0
//
//    for (i, char) in s.enumerated() {
//        if let val = dict[char], val >= start {
//            start = val+1
//        }
//        dict[char] = i
//        ans = max(ans, i - start + 1)
//    }
//
//    return ans
}
lengthOfLongestSubstring("pwwkew")//3
lengthOfLongestSubstring("abcabcbb")//3
lengthOfLongestSubstring("bbbb")//1
lengthOfLongestSubstring("<>")//2
lengthOfLongestSubstring(" ")//1
lengthOfLongestSubstring("cdd")//2
