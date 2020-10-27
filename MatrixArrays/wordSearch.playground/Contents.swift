import UIKit

//https://leetcode.com/problems/word-search/
//Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
//Output: true

//18 / 89 test cases passed.
func exist(_ board: [[Character]], _ word: String) -> Bool {
    var subarray = [String]()
    var i = 0
    var j = 0
    var wordArray = Array(word)
    
    while i < board.count {
        while j < board.count {
            if let first = wordArray.first {
                if board[i][j] == first {
                    subarray.append(String(first))
                    wordArray.remove(at: 0)
                    j += 1
                } else {
                    j += 1
                }
            }
        }
        i += 1
    }
    return subarray.joined() == word
}
exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCE")
exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB")
exist([["A","B"],["C","D"]], "ABCD")
