import UIKit

//https://leetcode.com/problems/detect-capital/
//We define the usage of capitals in a word to be right when one of the following cases holds:
//All letters in this word are capitals, like "USA".
//All letters in this word are not capitals, like "leetcode".
//Only the first letter in this word is capital, like "Google".
//Otherwise, we define that this word doesn't use capitals in a right way.

//Example 1:
//Input: "USA"
//Output: True

//Example 2:
//Input: "FlaG"
//Output: False

func detectCapitalUse(_ word: String) -> Bool {
    return word == word.uppercased() || word == word.capitalized || word == word.lowercased()
}
detectCapitalUse("USA")
detectCapitalUse("FLaG")
detectCapitalUse("Google")
detectCapitalUse("leetcode")

