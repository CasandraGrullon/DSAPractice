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
    var set = Set<String>()
    
    for i in 0..<words.count {
        let word = words[i]
        for j in i..<words.count - 1 {
            let string = words[j + 1]
            if word.contains(string) {
                set.insert(string)
            } else if string.contains(word) {
                set.insert(word)
            }
        }
    }
    return Array(set)
}
stringMatching(["leetcode","et","code"])
stringMatching(["mass","as","hero","superhero"])
stringMatching(["green","blue"])
