import UIKit

//https://leetcode.com/problems/longest-word-in-dictionary/
//Given a list of strings words representing an English Dictionary, find the longest word in words that can be built one character at a time by other words in words. If there is more than one possible answer, return the longest word with the smallest lexicographical order.
//If there is no answer, return the empty string.

//Example 1:
//Input:
//words = ["w","wo","wor","worl", "world"]
//Output: "world"
//Explanation:
//The word "world" can be built one character at a time by "w", "wo", "wor", and "worl".
//Ecample 2:
//Input:
//words = ["a", "banana", "app", "appl", "ap", "apply", "apple"]
//Output: "apple"
//Explanation:
//Both "apply" and "apple" can be built from other words in the dictionary. However, "apple" is lexicographically smaller than "apply".
func longestWord(_ words: [String]) -> String {
    
    guard !words.isEmpty else { return "" }
    
    var wordSet: Set<[Character]> = []
    
    for word in words {
        wordSet.insert(Array(word))
    }
    
    let sorted = words.sorted()
    var current = 0
    var possibleWords = [String]()
    
    while current < sorted.count {
        for word in 1..<sorted.count {
            if sorted[word].count >= sorted[current].count {
                if isSuperSet(word: sorted[word], set: wordSet) {
                    possibleWords.append(sorted[word])
                } else {
                    current += 1
                }
            }
        }
    }

    let first = possibleWords.sorted()[0]
    
    return first
}
func isSuperSet(word: String, set: Set<[Character]>) -> Bool {
    var result: Set<Bool> = []
    
    let current = Set(Array(word))
    
    for arr in set {
        if current.isSuperset(of: arr) {
            result.insert(true)
        } else {
            result.insert(false)
        }
    }
    return !result.contains(false)
}
//longestWord([])
//longestWord(["w","wo","wor","worl", "world"])
longestWord(["a", "banana", "app", "appl", "ap", "apply", "apple"])
