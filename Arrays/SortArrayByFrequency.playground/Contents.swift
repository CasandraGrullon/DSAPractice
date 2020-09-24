import UIKit

//https://leetcode.com/problems/sort-characters-by-frequency/
//Example 1:
//Input:
//"tree"
//Output:
//"eert"
//Explanation:
//'e' appears twice while 'r' and 't' both appear once.
//So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.

//Example 2:
//Input:
//"cccaaa"
//Output:
//"cccaaa"
//Explanation:
//Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
//Note that "cacaca" is incorrect, as the same characters must be together.

func frequencySort(_ s: String) -> String {
    //1. freq dict
    //2. append to results in order of highest to least freq
    var dict = [String: Int]()
    for char in s {
        if let value = dict[String(char)] {
            dict[String(char)] = value + 1
        } else {
            dict[String(char)] = 1
        }
    }
    var results = [String]()
    for (key, value) in dict.sorted(by: {$0.value > $1.value}) {
        results.append(contentsOf: Array(repeating: key, count: value))
    }
    return results.joined()
}
frequencySort("tree")
frequencySort("aaaccc")
frequencySort("Aabb")
