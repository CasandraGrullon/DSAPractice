import UIKit

//https://leetcode.com/problems/longest-univalue-path/
//find longest path where values are the same
//ex:
//     5
//    / \
//   4   5
//  / \   \
// 1   1   5
// answer: 2

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
class ListNode {
    var value: Int
    var next: ListNode?
    init(_ value: Int) {
        self.value = value
    }
}

class Solution {
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        //1. check if root is empty
        guard let _ = root else { return -100}
        let root = root
        
        //2. check if root has left & right branches
        guard root?.right != nil && root?.left != nil else {
            return 0
        }
        
        while var right = root?.right {
            
        }
        
        
    }
}
