import UIKit

//1.  Find the sum of the squares of all the odd numbers from numbers and then print it.
//a. Write code that removes all the odd numbers from the array.

//b. Write code that squares all the numbers in the array.

//c. Write code that finds the sum of the array.

//d. Now use map, filter and reduce to solve this problem.
let numbers = [1,2,3,4,5,6]
let filter = numbers.filter({$0 % 2 == 0})
print(filter)

let map = numbers.map({$0 * $0})
print(map)

let sum = numbers.reduce(0, +)
print(sum)

let d = ((numbers.filter{$0 % 2 == 1}).map({$0 * $0})).reduce(0, +)
print(d)

//2. Use filter to create an array called numbersEndingIn5 that contains all the
let numbers2 = [1, 3, 5, 85, 15, 11, 90, 5, 56, 45, 12, 75]

let endIN5 = numbers2.filter { $0 % 10 == 5 }
print(endIN5)

//3. Given a string as input, return a new string with all the vowels removed. Count "y" as a vowel.

let sentence = "These are the voyages of the starship Enterprise"

let vowels: Set<Character> = ["a", "e", "i" , "o" , "u", "y"]

func noVowels(for string: String) -> String {
    var newstring = String()
    for letter in string.lowercased() {
        if vowels.contains(letter){
            newstring.append("")
        } else {
            newstring.append(letter)
        }
    }
    return newstring
    
}
print(noVowels(for: sentence))

let newSentence = sentence.lowercased().filter { !vowels.contains($0) }
print(newSentence)

//4. Write a function factorial that receives a number n and recursively calculates and returns n!
func factorial(_ n: Int) -> Int {
    guard n > 1 else {
        return 1
    }
    return n * factorial(n - 1)
}

//5. Find the First Repeating word in a String

let words = "hey you how are you doing how how"

func firstRepeating(word: String) -> String {
    var dict = [String: Int]()
    
    let array = word.components(separatedBy: " ")
    var value = 1
    for word in array {
        
        if dict[word] == nil {
            dict[word] = 1
        } else {
            value += 1
            dict[word] = value
        }
    }
    var firstRepeated = String()
    
    for word in array {
        if let needed = dict[word]{
            if needed > 1 {
                
                firstRepeated = word
                break
            }
            
        }
        
    }
    return firstRepeated
}

print(firstRepeating(word: words))

//5. Given an array of numbers, reset the array to put all the non-zero numbers in front of all the zeros in the array, then return the new array and the count of non-zero numbers.
var numbers3 = [Int]()
var arr = [3,0,2,0,0,1,0,4]
var numOfZeros = [Int]()
//func lastOne()
for num in arr {
    if num > 0 {
        numbers3.insert(num, at: 0)
    } else {
        numbers3.append(num)
        numOfZeros.append(num)
    }
}
print(numbers3)
print(numOfZeros.count)



