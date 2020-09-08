import UIKit

//https://leetcode.com/problems/binary-tree-tilt/
//Given a binary tree, return the tilt of the whole tree.
//The tilt of a tree node is defined as the absolute difference between the sum of all left subtree node values and the sum of all right subtree node values. Null node has tilt 0.
//The tilt of the whole tree is defined as the sum of all nodes' tilt.
//Example:
//Input:
//         1
//       /   \
//      2     3

//Output: 1
//Explanation:
//Tilt of node 2 : 0
//Tilt of node 3 : 0
//Tilt of node 1 : |2-3| = 1
//Tilt of binary tree : 0 + 0 + 1 = 1

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

func findTilt(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    let current = root
    var result = 0
    
    rootValues(root: current, tilt: &result)
    
//    if let left = current?.left {
//        result += rootValues(root: left)
//    }
//    if let right = current?.right {
//        result += rootValues(root: right)
//    }

    return result
}
func rootValues(root: TreeNode?, tilt: inout Int) -> Int {
    guard let node = root else { return 0 }
    let leftValue = rootValues(root: node.left, tilt: &tilt)
    let rightValue = rootValues(root: node.right, tilt: &tilt)
    tilt += abs(leftValue - rightValue)
    return leftValue + rightValue + node.val
//    if let left = node.left {
//        leftValue = left.val
//    }
//    if let right = node.right {
//        rightValue = right.val
//    }
//
//    let result = leftValue - rightValue
//    if result < 0 {
//        return result * -1
//    } else {
//        return result
//    }
}
func findTilt2(_ root: TreeNode?) -> Int {
    guard let current = root else {
        return 0
    }
    var result = 0
    result += rootValues2(root: current)
    result += rootValues2(root: current.left)
    result += rootValues2(root: current.right)
    return result //+ current.val
}
func rootValues2(root: TreeNode?) -> Int {
    guard let node = root else { return 0 }
    let left = node.left?.val ?? 0
    let right = node.right?.val ?? 0
    
    if left - right < 0 {
        return left - right * -1
    }
    return left - right
}
var root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
findTilt(root)//1

var root1 = TreeNode(1)
var two = TreeNode(2)
var three = TreeNode(3)
var four = TreeNode(4)
var five = TreeNode(5)
root1.left = two
two.left = four
root1.right = three
three.left = five
findTilt2(root1)//11
