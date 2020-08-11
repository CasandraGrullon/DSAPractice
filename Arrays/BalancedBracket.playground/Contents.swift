import UIKit

//Sample Input
//{[()]} == Yes
//{[(])} == No
//{{[[(())]]}} == Yes


func isValid(_ s: String) -> Bool {
    
    var dict:[Character: Character] = ["(": ")", "{": "}", "[": "]"]
    var result: [Character] = []
    for char in s {
        if let next = dict[char] {
            //first we are getting the dict values
            result.append(next)
            print("next: \(next)")
            print("result: \(result)")
        } else if result.popLast() == char {
            //if the values are equal it means its a pair, means it valid
            print("char: \(char)")
            continue
        } else {
            return false
        }
    }
    
    return result.isEmpty
}

struct Stack<T> {
    private var elements = [T]()
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    public var peek: T? {
        return elements.last
    }
    
    public mutating func push(value: T) {
        elements.append(value)
    }
    public mutating func pop() -> T? {
        guard !elements.isEmpty else {return nil}
        return elements.removeLast()
    }
}

func isValidStack(_ s: String) -> Bool {
    guard !s.isEmpty else {return false}
    var dict:[Character: Character] = ["(": ")", "{": "}", "[": "]"]
    
}

var input = "{}()[]"
print(isValid(input))



//Sort Array By Parity
//Given an array of non-negative integers, return an array consisting of all the even elements, followed by all the odd elements.
//Input: [3,1,2,4]
//Output: [2,4,3,1]
//The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.

func sortArrayByParity(_ A: [Int]) -> [Int] {
    
}
