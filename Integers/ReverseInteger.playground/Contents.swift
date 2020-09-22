import UIKit

//Example 1:
//Input: 123
//Output: 321

//Example 2:
//Input: -123
//Output: -321

//Example 3:
//Input: 120
//Output: 21
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

//https://leetcode.com/problems/reverse-integer/
func reverse(_ x: Int) -> Int {
    var xString = String(x)
    var xArray = [String]()
    
    while !xString.isEmpty {
        if let last = xString.popLast() {
            if !last.isNumber {
                xArray.insert(String(last), at: 0)
            } else {
                xArray.append(String(last))
            }
        }
    }
    return Int(Int32(xArray.joined()) ?? 0)
}
reverse(-123)
reverse(120)
reverse(1534236469)
