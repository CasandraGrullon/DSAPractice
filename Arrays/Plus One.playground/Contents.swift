import UIKit

//https://leetcode.com/problems/plus-one/
//Given a non-empty array of digits representing a non-negative integer, increment one to the integer.
//The digits are stored such that the most significant digit is at the head of the list, and each element in the array contains a single digit.
//You may assume the integer does not contain any leading zero, except the number 0 itself.
//Example 1:
//Input: [1,2,3]
//Output: [1,2,4]
//Explanation: The array represents the integer 123.

func plusOne(_ digits: [Int]) -> [Int] { //75/109 test cases
    //[1,2,9] == 129 + 1 = 130 -> [1,3,0]
    var copy = digits
    //1. turn array into an integer
    var singleNumber = String()
    
    for number in copy {
        singleNumber.append(String(number))
    }
    
    //2. increment the value by one
    let newValue = String((Int(singleNumber) ?? -100) + 1)
    
    //3. seperate the values into an array
    copy.removeAll()
    for char in newValue {
        copy.append(Int(String(char)) ?? -200)
    }
    return copy
}

let input = [1,3,9]
let output = plusOne(input)

//leet code solution
func plusOne2(_ digits: [Int]) -> [Int] {
    var nums = digits
    for (i,n) in digits.enumerated().reversed()
    {
        //1,3,9 -> 9,3,1
        if n < 9
        {
            nums[i] += 1
            return nums //exits loop
        }
        
        nums[i] = 0 //0,3,1
    }
    
    return nums
}

let input2 = [1,3,9]
let output2 = plusOne2(input2)
