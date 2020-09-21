import UIKit

//https://leetcode.com/problems/verifying-an-alien-dictionary/
//Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
//Output: true
//Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.

//Example 2:
//Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
//Output: false
//Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
func isAlienSorted(_ words: [String], _ order: String) -> Bool {
    //1. make a dictionary of order string
    //2. compare values in a loop
    guard !words.isEmpty else {
        return true
    }
    //1.
    var dictionary = [Character: Int]()
    for (index, char) in order.enumerated() {
        dictionary[char] = index + 1
    }
    //2.
    for i in 0..<words.count - 1 {
        let word1 = Array(words[i])
        let word2 = Array(words[i + 1])
        var flag = false
        for i in 0..<min(word1.count, word2.count) {
            if dictionary[word1[i]] ?? 0 < dictionary[word2[i]] ?? 0 {
                flag = true
                break
            } else if dictionary[word1[i]] ?? 0 == dictionary[word2[i]] ?? 0 {
                continue
            } else {
                return false
            }
        }
        if word1.count > word2.count && !flag {
            return false
        }
    }
    return true
}

isAlienSorted(["hello", "leetcode"], "hlabcdefgijkmnopqrstuvwxyz")//true
isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz")//false
isAlienSorted(["app","apple"], "abcdefghijklmnopqrstuvwxyz")//true
isAlienSorted(["apple","app"], "abcdefghijklmnopqrstuvwxyz")//false
isAlienSorted(["apap","app"], "abcdefghijklmnopqrstuvwxyz")//true
