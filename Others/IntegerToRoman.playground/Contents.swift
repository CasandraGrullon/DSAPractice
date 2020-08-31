import UIKit

//https://leetcode.com/problems/integer-to-roman/
//Input: 3
//Output: "III"

//Symbol       Value
//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000

func intToRoman(_ num: Int) -> String {
    var stringArray = [String]()
    let numString = String(num)
    
    
    
}
func makeArray(_ number: Int, _ string: String, _ count: Int) {
    var result = [String]()
    
    if count == 1 {
        if number < 4 {
            let array = Array(repeating: "I", count: number)
            result = array
        } else if number > 5 && number < 9 {
            let array = Array(repeating: "I", count: number - 5)
            result.append("V")
            result.append(contentsOf: array)
        } else if number == 4 {
            result = ["IV"]
        } else if number == 5 {
            result = ["V"]
        } else if number == 9 {
            result = ["IX"]
        }
    } else if count == 2 {
        if number < 14 && number > 10 {
            let array = Array(repeating: "I", count: number - 10)
            result.append("X")
            result.append(contentsOf: array)
        } else if number > 5 && number < 9 {
            let array = Array(repeating: "I", count: number - 5)
            result.append("V")
            result.append(contentsOf: array)
        } else if number == 4 {
            result = ["IV"]
        } else if number == 5 {
            result = ["V"]
        } else if number == 9 {
            result = ["IX"]
        }
    } else if count == 3 {
        
    } else if count == 4 {
        
    }
    
}
