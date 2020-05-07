import UIKit

//Find Words That Can Be Formed by Characters

//Input: words = ["cat","bt","hat","tree"], chars = "atach"
//Output: 6
//Explanation:
//The strings that can be formed are "cat" and "hat" so the answer is 3 + 3 = 6.
func countCharacters(_ words: [String], _ chars: String) -> Int {
var sumOfLength = 0

for word in words { // iterate through array of words
    var chars = Array(chars) // make chars into array
    var count = 0 // count to keep track of word
    for letter in word {
        if chars.contains(letter) {
            count += 1
            let index = chars.firstIndex(of: letter) // get index of the letter in char
            chars.remove(at: index!) // remove char at that index
        } else { // not found
            break // breaks out of loop
        }
    }
    
    if count == word.count {
        sumOfLength += word.count
    }
}
return sumOfLength
    
}


var example1 = ["hello","world","leetcode"]
var chars = "welldonehoneyr"
countCharacters(example1, chars) //expected 10
