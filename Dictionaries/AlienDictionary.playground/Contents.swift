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
    //2. make words into arrays using the dictionary values
    //3. compare values in a loop
    guard !words.isEmpty else {
        return true
    }
    //1.
    var dictionary = [Character: Int]()
    for (index, char) in order.enumerated() {
        dictionary[char] = index + 1
    }
    //2.
    var i = 0
    var wordValues = [[Int]]()
    while i < words.count {
        let word = words[i]
        let array = wordOrder(word: word, order: dictionary)
        wordValues.append(array)
        i += 1
    }
    //3.
    i = 0
    var j = 0
    while i < wordValues.count {
        for word in i + 1..<wordValues.count {
            if wordValues[i][j] < wordValues[word][j] {
                return true
            } else if wordValues[i][j] > wordValues[word][j] {
                return false
            } else {
                j += 1
            }
        }
    }
    
    return false
}
func wordOrder(word: String, order: [Character: Int]) -> [Int] {
    var result = [Int]()
    var copy = Array(word)
    
    while !copy.isEmpty {
        let letter = copy.removeFirst()
        for (key, value) in order {
            if letter == key {
                result.append(value)
            }
        }
    }
    return result
}

var input1 = ["hello", "leetcode"]
isAlienSorted(input1, "hlabcdefgijkmnopqrstuvwxyz")
isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz")

