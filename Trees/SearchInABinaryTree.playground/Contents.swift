import UIKit

//https://leetcode.com/problems/search-in-a-binary-search-tree/
//Given the root node of a binary search tree (BST) and a value. You need to find the node in the BST that the node's value equals the given value. Return the subtree rooted with that node. If such node doesn't exist, you should return NULL.
//Given the tree:
//        4
//       / \
//      2   7
//     / \
//    1   3
//
//And the value to search: 2
//You should return this subtree:
//
//      2
//     / \
//    1   3

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

func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    
    //STEPS:
    //1. check is root value == value
    //2. check if root.left == value
    //3. check if root.right == value
    
    var checkRoot = checkValue(root: root, value: val)
    if checkRoot?.val == val {
        return checkRoot
    }
    if let left = root.left {
        checkRoot = checkValue(root: left, value: val)
        if checkRoot?.val == val {
            return checkRoot
        }
    }
    if let right = root.right {
        checkRoot = checkValue(root: right, value: val)
        if checkRoot?.val == val {
            return checkRoot
        }
    }
    
    return nil
}
func checkValue(root: TreeNode?, value: Int) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    
    if root.val == value {
        return root
    }
    
    if let left = root.left {
        if left.val == value {
            return left
        }
    }
    if let right = root.right {
        if right.val == value {
            return right
        }
    }
    return nil
}

var root = TreeNode(4)
var rootLeft = TreeNode(2)
var rootRight = TreeNode(7)
root.left = rootLeft
root.right = rootRight
rootLeft.left = TreeNode(1)
rootLeft.right = TreeNode(3)
searchBST(root, 2)
//[62,2,93,null,30,null,null,15,null,null,null]
//15
var root2 = TreeNode(62)
var two = TreeNode(2)
var ninethree = TreeNode(93)
var thirty = TreeNode(30)
var fifteen = TreeNode(15)
root2.left = two
root2.right = ninethree
two.right = thirty
ninethree.left = fifteen
searchBST(root2, 15)
