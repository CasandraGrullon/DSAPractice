import UIKit

//recursive reverse string

func reverseString(_ s: inout [Character]) {
    guard s.count > 1 else {
        return
    }
    for index in 0..<s.count {
        let last = s.popLast() ?? "c"
        s.insert(last, at: index)
    }
    
}

var input : [Character] = ["h","e","l","l","o"]
reverseString(&input)


var digitSet = Set<Int>()
var result = false

func isHappy(_ n: Int) -> Bool {
 var digitArray = [Int]()
    var sum = 0
    var totalSum = 0
    for digit in n.description {
        digitArray.append(digit.wholeNumberValue ?? 1000)
    }
    print()
    print(digitArray)
    for digit in digitArray {
        sum += digit * digit
    }
    
    totalSum = sum
    print("total sum \(totalSum)")
    
    if digitSet.contains(totalSum) {
        print("does contain \(totalSum)")
        //print("false")
        result = false
    } else {
        guard totalSum != 1 else {return true}
        digitSet.insert(totalSum)
        print("doesn't contain \(totalSum)")
        isHappy(totalSum)
    }
    
    return result
}

isHappy(11)

func isHappy1(n: Int) -> Bool {
    var digits = Set<Int>()
    var sum = 0
    var current = n
    
    while sum != 1 {
        sum = 0
        while current != 0 {
            let dig = current % 10
            sum += dig * dig
            current = current / 10
        }
        
         current = sum
        
        if digits.contains(sum) {
            print("does contain \(sum)")
            return false
        } else {
            digits.insert(sum)
             print("doesn't contain \(sum)")
        }
    }
    return true
}

isHappy1(n: 11)


