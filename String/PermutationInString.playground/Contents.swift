import UIKit

//https://leetcode.com/problems/permutation-in-string/
//Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.
//Example 1:
//Input: s1 = "ab" s2 = "eidbaooo"
//Output: True
//Explanation: s2 contains one permutation of s1 ("ba").

//Example 2:
//Input:s1= "ab" s2 = "eidboaoo"
//Output: False

// 72 / 103 test cases passed
func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    guard s1.count <= s2.count else {
        return false
    }
    let s1Array = Array(s1).sorted()
    var s2array = Array(s2)
    var array = [Character]()

    while s2array.count >= s1.count {
        array = createArray(array: s2array, low: 0, high: s1.count)
        if array == s1Array {
            return true
        }
        s2array.removeFirst()
    }
    
    return false
}
func createArray(array: [Character], low: Int, high: Int) -> [Character] {
    var result = [Character]()
    for char in array[low..<high] {
        result.append(char)
    }
    return result.sorted()
}
// leetcode "sliding window solution"
func checkInclusion2(_ s1: String, _ s2: String) -> Bool {
    guard s2.count >= s1.count else { return false }
    let chars = Array(s2)
    let countsOfS1 = Array(s1).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var charCountsInSlidingRange = [Character: Int]()
    
    for i in 0 ..< s2.count {
        let indexToRemove = i - s1.count
        if indexToRemove >= 0 {
            let count = charCountsInSlidingRange[chars[indexToRemove]]!
            charCountsInSlidingRange[chars[indexToRemove]] = count > 1 ? count - 1 : nil
        }
        charCountsInSlidingRange[chars[i], default: 0] += 1
        if countsOfS1 == charCountsInSlidingRange {
            return true
        }
    }
    return false
}
checkInclusion2("hello", "ooolleoooleh")
checkInclusion2("ab", "ab")
checkInclusion2("abc", "bbbca")
