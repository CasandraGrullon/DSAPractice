import UIKit

// m = array1.count n = array2.count
// m >= n > 0
// z = x & y //binary operator

func binaryOperatorSolution(m: [Int], n: [Int]) -> Int {
    //1. if this parameter( M >= N > 0 ) isn't true, function isn't valid return -1
    guard m.count >= n.count, n.count > 0 else { return -1 }
    
    //1. used a helper function to create single ints from arrays
    let a = flattenArray(array: m)
    let b = flattenArray(array: n)
    
    //2. guard b > a
    guard b > a else {return -1}
    
    //return the bitwise and operator value
    return a & b
}
func flattenArray(array: [Int]) -> Int {
    var string = String()
    var result = Int()
    //cannot flatten an array of integers to a single int automatically
    //need to cast int to a string
    for num in array {
        string += String(num)
    }
    //casting string to int gives an optional value, if let statement provides unwrapped value
    if let number = Int(string) {
        result = number
    }
    return result
}
binaryOperatorSolution(m: [1,0,1], n: [1,1,0])// 101 & 111 & 110 == 100
