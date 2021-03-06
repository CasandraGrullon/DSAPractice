import UIKit

//https://leetcode.com/problems/shuffle-the-array/

//Input: nums = [2,5,1,3,4,7], n = 3
//Output: [2,3,5,4,1,7]
//Explanation: Since x1=2, x2=5, x3=1, y1=3, y2=4, y3=7 then the answer is [2,3,5,4,1,7].

func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
    var xArray = nums[0..<n]
    var yArray = nums[n..<nums.count]
    var result = [Int]()
    
    while !xArray.isEmpty && !yArray.isEmpty {
        if let x = xArray.first, let y = yArray.first {
            result.append(x)
            result.append(y)
            xArray.removeFirst()
            yArray.removeFirst()
        }
    }
    
    return result
}
shuffle([2,5,1,3,4,7], 3)

func arrayShift(elements: [Int]) -> Bool {
    var copy = elements
    let sorted = elements.sorted()
    var result = Bool()
    
    while copy != sorted {
        if let pivot = copy.last {
            copy.insert(pivot, at: 0)
            copy.removeLast()
            
        }
    }
    
    if copy == sorted {
        result = true
    } else {
        result = false
    }
    return result
}
arrayShift(elements: [3, 4, 1, 2])

func digitAnagrams(a: [Int]) -> Int64 {
    var strings = [String]()
    var count = 0
    for num in a {
        strings.append(String(num))
    }
    var current = 0
    let num = strings[current]

    for i in 1..<strings.count {
        if strings[i] == num {
            count += 1
        } else if strings[i] == String(num.reversed()) {
            count += 1
        }
        current += 1
    }

    return Int64(count)
}
func reverseNumbers(num: String) -> String {
    var reversed = num.reversed()
    return String(reversed)
}
digitAnagrams(a:[25, 35, 872, 228, 53, 278, 872])//4
