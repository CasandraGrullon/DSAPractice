import UIKit

//https://leetcode.com/problems/symmetric-tree/
//For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
//
//    1
//   / \
//  2   2
// / \ / \
//3  4 4  3
//But the following [1,2,2,null,3,null,3] is not:
//    1
//   / \
//  2   2
//   \   \
//   3    3

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

func isSymmetric(_ root: TreeNode?) -> Bool {
    guard root != nil else { return true }
    
    return checkValues(left: root?.left, right: root?.right)
}
func checkValues(left: TreeNode?, right: TreeNode?) -> Bool {
    if left == nil && right == nil {
        return true
    }
    return (left?.val == right?.val)
        && checkValues(left: left?.right, right: right?.left)
        && checkValues(left: left?.left, right: right?.right)
}
let root = TreeNode(1)
let left = TreeNode(2)
let right = TreeNode(2)
root.left = left
root.right = right
//right.left = TreeNode(3)
right.right = TreeNode(3)
//left.left = TreeNode(3)
left.right = TreeNode(3)
isSymmetric(root)
