import UIKit

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/

//Say you have an array prices for which the ith element is the price of a given stock on day i.

//Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
//Input: [7,1,5,3,6,4]
//Output: 7
//Explanation:
//Buy on day 2 (price = 1), sell on day 3 (price = 5), profit = 5-1 = 4.
//Then buy on day 4 (price = 3), sell on day 5 (price = 6), profit = 6-3 = 3.
// 4 + 3 = 7

struct Queue {
    var elements = [Int]()
    var isEmpty: Bool {
        return elements.isEmpty
    }
    var peek: Int? {
        return elements.first
    }
    mutating func enqueue(_ x: Int) {
        elements.append(x)
    }
    mutating func dequeue() -> Int? {
        guard !isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
}

func maxProfit(_ prices: [Int]) -> Int {
    var result = 0
    if prices.count == 0 {
        return 0
    }
    for index in 1..<prices.count {
        if prices[index - 1] < prices[index] {
            result += prices[index] - prices[index - 1]
        }
    }
    
    return result
}

var input = [7,1,5,3,6,4]
maxProfit(input)
