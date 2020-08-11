import UIKit

//Determine if a given string is a palindrome (the same backwards and forwards) ignoring capitalization and punctuation.
func palindrome(string: String) -> Bool {
    var array = [Character]()
    var reversed = [Character]()
    
    for char in string.lowercased() {
        if char.isLetter {
            array.append(char)
            
        }
    }
    var copy = array
    
    for index in 0...copy.count - 1 {
        var last = copy.popLast() ?? "b"
        reversed.append(last)
    }
    print(array)
    print(reversed)
    if array == reversed {
        return true
    } else {
        return false
    }
    
}
var example = "Madam I'm Adam"
palindrome(string: example)

func tseringPalindrome(string: String) -> Bool {
    var reversed = ""
    let noPunc = string.filter {$0.isLetter}.lowercased()
    for char in noPunc {
        reversed = String(char) + reversed
    }
    if reversed == noPunc {
        return true
    } else {
        return false
    }
}
tseringPalindrome(string: example)

//Determine if a given string has all the letters in the English alphabet in it.
func pangram(string: String) -> Bool {
    let alphabet: Set<Character> = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" ]
    
    var stringSet = Set<Character>()
    
    for char in string.lowercased() {
        if char.isLetter {
            stringSet.insert(char)
        }
    }
    if stringSet == alphabet {
        return true
    } else {
        return false
    }
    
}
var example1 = "The quick brown fox jumps over the lazy dog"
pangram(string: example1)

//remove vowels
func removeVowels(string: String) -> String {
    let vowels: Set<Character> = ["a","e","i","o","u","y"]
    var noVowels = ""
    
    for char in string { // O(n)
        if vowels.contains(char) { //O(n: string, m: set)
            //because we are looping through two different things, it isnt quadratic
            noVowels += String(char)
        }
    }
    
    return noVowels
}
removeVowels(string: example1)

//Given a string, return a comma separated string that contains the counts of each character in a row.

//ex: "abccdacc" = "1a, 1b, 2c, 1d, 1a, 2c"

func sequenceCount(string: String) -> String {
    var counter = 0
    var previousCounter = 0
    var array = [String]()
    let stringArray = Array(string)
    var currentLetter = String()
    
    
    for char in stringArray {
        if currentLetter == String(char) {
            counter += 1
        } else {
            counter = 1
            previousCounter = counter
            currentLetter = String(char)
        }
        
        if previousCounter < counter {
            array.popLast()
            array.append("\(counter)\(char)")
        } else {
            array.append("\(previousCounter)\(char)")
        }
        
    }
    
    return array.description
}
let example3 = "abccdacc"
sequenceCount(string: example3)
print("result: \(sequenceCount(string: example3))")
