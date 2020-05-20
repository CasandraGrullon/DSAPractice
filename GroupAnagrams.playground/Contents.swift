import UIKit

//https://leetcode.com/problems/group-anagrams/
//Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
//Output: [ ["ate","eat","tea"], ["nat","tan"], ["bat"]]

func groupAnagrams(_ strs: [String]) -> [[String]] {
    //solution 1: O(n)
    var dict = [String:[String]]()
    
    for i in 0..<strs.count {
        //sorting the characters in the word by alphabetical order ex: eat -> aet, ate -> aet, tea -> aet
        let word = sortWords(strs[i])
        //print("strs[i]: \(strs[i]), word: \(word)")
        if let _ = dict[word] {
            // if the dict[word] == aet, append eat, tea, ate
            dict[word]?.append(strs[i])
        }
        else { //else, make a new dictionary key
            dict[word] = [strs[i]]
        }
    }
    
    return Array(dict.values)
}
func sortWords(_ word: String) -> String { //helper function to keep one above O(n) instead of O(n^2)
    return String(Array(word).sorted())
}
var input = ["eat", "tea", "tan", "ate", "nat", "bat"]
groupAnagrams(input)
