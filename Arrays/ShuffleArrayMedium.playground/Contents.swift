import UIKit

//https://leetcode.com/problems/shuffle-an-array/

class Solution {
    var nums: [Int]
    
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return nums
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        var shuffled = nums
        var length = shuffled.count
        
        for _ in shuffled {
            let randomIndex = random(length: length)
            if randomIndex != length - 1 {
                shuffled.swapAt(randomIndex, length - 1)
            }
            length -= 1
        }
        
        return shuffled
    }
    private func random(length: Int) -> Int {
        return Int.random(in: 0..<length)
    }
}
var input = Solution([1,2,3])
input.shuffle()
input.shuffle()
input.shuffle()
