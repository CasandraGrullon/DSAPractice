import UIKit

//https://leetcode.com/problems/insert-into-a-binary-search-tree/
//Given the tree:
//        4
//       / \
//      2   7
//     / \
//    1   3

//And the value to insert: 5
//You can return this binary search tree:
//         4
//       /   \
//      2     7
//     / \   /
//    1   3 5

//This tree is also valid:
//         5
//       /   \
//      2     7
//     / \
//    1   3
//         \
//          4

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    var current = root
    var currentLeft: TreeNode?
    var currentRight: TreeNode?
    
    guard current != nil else {
        return nil
    }
    
    while current != nil {
        if let currentLeft = current?.left {
            
        }
    }
    
    
    return root
}
