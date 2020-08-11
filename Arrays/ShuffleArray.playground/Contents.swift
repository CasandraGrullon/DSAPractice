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
