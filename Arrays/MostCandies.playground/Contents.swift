import UIKit

//https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/
//Input: candies = [2,3,5,1,3], extraCandies = 3
//Output: [true,true,true,false,true]
//Kid1 has 2 candies and if he or she receives all extra candies (3) will have 5 candies --- the greatest number of candies among the kids.
//Kid2 has 3 candies and if he or she receives at least 2 extra candies will have the greatest number of candies among the kids.
//Kid3 has 5 candies and this is already the greatest number of candies among the kids.
//Kid4 has 1 candy and even if he or she receives all extra candies will only have 4 candies.
//Kid5 has 3 candies and if he or she receives at least 2 extra candies will have the greatest number of candies among the kids.
func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    guard let max = candies.max() else {
        return []
    }
    var results = [Bool]()
    for num in candies {
        if num + extraCandies >= max {
            results.append(true)
        } else {
            results.append(false)
        }
    }
    return results
}
kidsWithCandies([2,3,5,1,3], 3)
