import UIKit

//https://leetcode.com/problems/flatten-binary-tree-to-linked-list/
//Given a binary tree, flatten it to a linked list in-place.
//
//For example, given the following tree:
//
//    1
//   / \
//  2   5
// / \   \
//3   4   6
//The flattened tree should look like:
//
//1
// \
//  2
//   \
//    3
//     \
//      4
//       \
//        5
//         \
//          6

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
//Correct solution!
func flatten(_ root: TreeNode?) {
    var array = [Int]()
    
    guard root != nil else {
        return
    }
    appendToArray(root, &array)
    
    var current = root
    root?.right = nil
    root?.left = nil
    
    for (index, node) in array.enumerated() where index > 0 {
        current?.right = TreeNode(node)
        current = current?.right
    }
}
func appendToArray(_ root: TreeNode?, _ array: inout [Int]){
    guard root != nil else {
        return
    }
    array.append(root!.val)
    
    if let left = root?.left {
        appendToArray(left, &array)
    }
    if let right = root?.right {
        appendToArray(right, &array)
    }
}
var root = TreeNode(1)
var left = TreeNode(2)
var right = TreeNode(5)
root.left = left
root.right = right
left.left = TreeNode(3)
left.right = TreeNode(4)
right.right = TreeNode(6)
flatten(root)
