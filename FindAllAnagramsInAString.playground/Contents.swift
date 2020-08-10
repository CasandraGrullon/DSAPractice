import UIKit

//https://leetcode.com/problems/find-all-anagrams-in-a-string/
//Example 1
//Input:
//s: "cbaebabacd" p: "abc"
//Output:
//[0, 6]
//Explanation:
//The substring with start index = 0 is "cba", which is an anagram of "abc".
//The substring with start index = 6 is "bac", which is an anagram of "abc".

//Example 2:
//Input:
//s: "abab" p: "ab"
//Output:
//[0, 1, 2]
//Explanation:
//The substring with start index = 0 is "ab", which is an anagram of "ab".
//The substring with start index = 1 is "ba", which is an anagram of "ab".
//The substring with start index = 2 is "ab", which is an anagram of "ab".

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    guard s.count > p.count else {
        return []
    }

    let sArray = makeArray(s: s, count: p.count)
    let pArray = p.map {$0}
    var results = [Int]()
    
    for (index, string) in sArray.enumerated() {
        //this solution solved 34/36 cases
        if string.sorted() == p.sorted() {
            results.append(index)
        }
//solution with a set worked for 33/36 test cases
//        if set == setP {
//            results.append(index)
//        }
    }
    
    return results
}
func makeArray(s: String, count: Int) -> [String] {
    var result = [String]()
    var sCopy = [String]()
    
    for char in s {
        sCopy.append(String(char))
    }
    let range = 0..<count
    
    
    while !sCopy.isEmpty && sCopy.count >= count {
        let string = sCopy[range].joined()
        result.append(string)
        sCopy.removeFirst()
    }
    print(result)
    return result
}
findAnagrams("abab", "ab") //0,1,2
findAnagrams("cbaebabacd", "abc") //0,6
findAnagrams("baa", "aa") //1
findAnagrams("ababababab", "aab") //0,2,4,6
