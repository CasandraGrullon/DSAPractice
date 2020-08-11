import UIKit

func isPangram(string: String) -> Bool {
    let alphabetSet : Set<String> = ["a" , "b" , "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x" , "y", "z"]
    var wordSet: Set<String> = []
    
    for char in string {
        if char.isLetter {
            wordSet.insert(String(char).lowercased())
        }
    }
    
//    if alphabetSet.isSubset(of: wordSet) {
//        return true
//    } else {
//        return false
//    }
    return alphabetSet.isSubset(of: wordSet)
    
    
}
var input = "The quick brown fox jumps over the lazy dog"
isPangram(string: input)
var input2 = " Four score and seven years ago, our fathers brought forth on this continent..."
isPangram(string: input2)

// TO REVIEW
// CharacterSet
// Review Sets and set functions
// NSOrderedSet

