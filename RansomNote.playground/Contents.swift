import UIKit

//https://leetcode.com/problems/ransom-note/

//Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.

//Each letter in the magazine string can only be used once in your ransom note.

//Input: ransomNote = "a", magazine = "b"    Output: false

//Input: ransomNote = "aa", magazine = "ab"  Output: false

//Input: ransomNote = "aa", magazine = "aab" Output: true
//Constraints:
//You may assume that both strings contain only lowercase letters.

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    //first we need to hold the characters in the magazine string in a dictionary
    var magDict = [Character: Int]()
   
    for letter in magazine {
        if let value = magDict[letter] {
            magDict[letter] = value + 1
        } else {
            magDict[letter] = 1
        }
    }
    
    for letter in ransomNote {
        if let value = magDict[letter] {
            //if the value is less than 0 end the loop, return false
            if value - 1 < 0 {
                print("value - 1 < 0")
                return false
            }
            //if its true, start decrementing the value before the value - 1 is less than 0
            magDict[letter] = value - 1
            print(magDict)
        } else {
            return false
        }
    }
    //once the dictionary is emptied, return true
    return true
}
let ransomeNote1 = "bab"
let magazine1 = "bba"
canConstruct(ransomeNote1, magazine1)
