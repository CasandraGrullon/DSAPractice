import UIKit

// Write a recursive function that determines whether or not an input String contains the letter 'a'.
//abcd [b,a,c,d]
//remove b
//[a,c,d]
func checkForA(string: inout String, target: String) -> Bool {
    guard !string.isEmpty else {
        return false
    }
    //1. check first value in string
    //2. if first == a, return true
    //3. else remove first and check new first value
    if String(string.prefix(1)).lowercased() != target.lowercased() {
        string.removeFirst()
        return checkForA(string: &string, target: target)
    }
    return true
}
var input = "bca"
print(checkForA(string: &input, target: "a"))
