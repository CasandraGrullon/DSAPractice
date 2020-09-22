import UIKit

//https://leetcode.com/problems/minimum-index-sum-of-two-lists/

//Example 1:
//Input:
//["Shogun", "Tapioca Express", "Burger King", "KFC"]
//["Piatti", "The Grill at Torrey Pines", "Hungry Hunter Steakhouse", "Shogun"]
//Output: ["Shogun"]
//Explanation: The only restaurant they both like is "Shogun".

//Example 2:
//Input:
//["Shogun", "Tapioca Express", "Burger King", "KFC"]
//["KFC", "Shogun", "Burger King"]
//Output: ["Shogun"]
//Explanation: The restaurant they both like and have the least index sum is "Shogun" with index sum 1 (0+1) while "KFC" = (3 + 1) => 4

//20 % faster
func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
    var dict = [String: [Int]]()

    for (index, word) in list1.enumerated() {
        if let _ = dict[word] {
            dict[word]?.append(index)
        } else {
            dict[word] = [index]
        }
    }
    for (index, word) in list2.enumerated() {
        if let _ = dict[word] {
            dict[word]?.append(index)
        } else {
            dict[word] = [index]
        }
    }
    var lowest = Int.max
    var commonRestaurants = [String]()

    for (_, value) in dict {
        if value.count > 1 {
            let sum = value.reduce(0, +)
            if sum < lowest {
                lowest = sum
            }
        }
    }
    for (key, value) in dict {
        if value.count > 1 {
            let sum = value.reduce(0, +)
            if sum == lowest {
                commonRestaurants.append(key)
            }
        }
    }
    return commonRestaurants
}

//51 / 133 test cases passed.
func findRestaurant2(_ list1: [String], _ list2: [String]) -> [String] {
    var i = 0
    var j = 0
    var dict = [String: Int]()
    var lowest = Int.max
    
    while i < list1.count {
        while j < list2.count {
            if list1[i] == list2[j] {
                dict[list1[i]] = i + j
                if i + j < lowest {
                    lowest = i + j
                }
                print(dict)
            }
            j += 1
        }
        j = 0
        i += 1
    }
    
    var results = [String]()
    
    for (key, value) in dict {
        if value == lowest {
            results.append(key)
        }
    }
    return results
}
findRestaurant(["Shogun", "Tapioca Express", "Burger King", "KFC"], ["KFC", "Shogun", "Burger King"])
findRestaurant(["Shogun", "Tapioca Express", "Burger King", "KFC"], ["Piatti", "The Grill at Torrey Pines", "Hungry Hunter Steakhouse", "Shogun"])
