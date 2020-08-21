import UIKit

//https://leetcode.com/problems/string-matching-in-an-array/
//Example 1:
//Input: words = ["mass","as","hero","superhero"]
//Output: ["as","hero"]
//Explanation: "as" is substring of "mass" and "hero" is substring of "superhero".
//["hero","as"] is also a valid answer.
//
//Example 2:
//Input: words = ["leetcode","et","code"]
//Output: ["et","code"]
//Explanation: "et", "code" are substring of "leetcode".
//
//Example 3:
//Input: words = ["blue","green","bu"]
//Output: []

func stringMatching(_ words: [String]) -> [String] {
    var results = [String]()
    var current = words.count - 1
    var dictionary = [String: [String]]()
    
    while current >= 0 {
        for word in words {
            let value = checkChar(word1: word, word2: words[current])
            if value == word {
                if var val = dictionary[words[current]] {
                    val.append(value)
                    dictionary[words[current]] = val
                } else {
                    dictionary[words[current]] = [value]
                }
            }
        }
        current -= 1
    }
    for (_, value) in dictionary {
        results.append(contentsOf: value)
    }
    return results
}
func checkChar(word1: String, word2: String) -> String {
    let set1 = Set(word1)
    let set2 = Set(word2)
    var value = String()
    guard word1 != word2 else {
        return ""
    }
    if set1.isSuperset(of: set2) {
        value = word2
    } else if set2.isSuperset(of: set1) {
        value = word1
    }
    return value
}
stringMatching(["leetcode","et","code"])
stringMatching(["mass","as","hero","superhero"])
stringMatching(["green","blue"])
