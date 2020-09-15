import UIKit

func findMinandMax(nums: [Int]) -> (min: Int, max: Int)? {
    guard !nums.isEmpty else {
        return nil
    }
    var results: (min: Int, max: Int)
    //1. check if array has more than 1 value
    if nums.count > 1 {
        //1. sort the array
        let sorted = nums.sorted()
        //2. add min and max to results
        results = (min: sorted[0], max: sorted[sorted.count - 1])
    } else {
        results = (min: nums[0], max: nums[0])
    }
    return results
}
findMinandMax(nums: [1,3,5,4,7,0])
findMinandMax(nums: [1])

//Alex's solution
func findMinMax(nums: [Int]) -> (min: Int, max: Int)? {
    guard let first = nums.first else {
        return nil
    }
    var currentMin = first
    var currentMax = first
    
    for num in nums {
        if num < currentMin {
            currentMin = num
        } else if num > currentMax {
            currentMax = num
        }
    }
    return (currentMin, currentMax)
}
findMinMax(nums: [1,3,5,4,7,0])
