import UIKit

//https://leetcode.com/problems/validate-binary-search-tree/
//Given a binary tree, determine if it is a valid binary search tree.

//Example 1:
//    2
//   / \
//  1   3
//Input: [2,1,3]
//Output: true


//Example 2:
//    5
//   / \
//  1   4
//     / \
//    3   6
//Input: [5,1,4,null,null,3,6]
//Output: false
//Explanation: The root node's value is 5 but its right child's value is 4.

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
extension TreeNode {
    func printNodes() {
        print("\(val)", terminator: " ")
        left?.printNodes()
        right?.printNodes()
    }
    func seeNodes(root: TreeNode) -> [Int] {
        var results = [Int]()
        
//        if let left = left {
//            results.append(left.val)
//        }
        
        results.append(root.val)
        
//        if let right = right {
//           results.append(right.val)
//        }
        
        return results
    }
}

func isValidBST(_ root: TreeNode?) -> Bool {
    var treeArray = [Int]()
    guard root != nil else {return true}
    
    //1. traverse through the tree (in order)
    if let left = root?.left {
        treeArray.append(contentsOf: left.seeNodes(root: left))
    }
    if let root = root {
        treeArray.append(contentsOf: root.seeNodes(root: root))
    }
    if let right = root?.right {
        treeArray.append(contentsOf: right.seeNodes(root: right))
    }

    //2. check if the array is in ascneding order/is sorted
    let sorted = treeArray.sorted()
    print("treeArray: \(treeArray), sorted: \(sorted)")

    if sorted == treeArray {
        return true
    } else {
        return false
    }
}
var tree1 = TreeNode(2)
tree1.left = TreeNode(1)
tree1.right = TreeNode(3)
isValidBST(tree1)//true
var tree2 = TreeNode(5)
tree2.left = TreeNode(1)
tree2.right = TreeNode(4)
isValidBST(tree2)//false
let tree3 = TreeNode(0)
isValidBST(tree3)//true
let tree4 = TreeNode(1)
tree4.right = TreeNode(1)
isValidBST(tree4)//false
let tree5 = TreeNode(10)
let tree5L = TreeNode(5)
let tree5R = TreeNode(15)
let tree5RL = TreeNode(6)
let tree5RR = TreeNode(20)
tree5.left = tree5L
tree5.right = tree5R
tree5R.left = tree5RL
tree5R.right = tree5RR
isValidBST(tree5)//false

//solution not mine
//private func checkBst(_ root: TreeNode?, minValue: Int, maxValue: Int) -> Bool {
//    if root == nil {
//        return true
//    }
//    //at all times, the root value must be greater than the left side and less than the right side
//    //if the min value is greater than or equal to root, its invalid
//    //if the max value is less than or equal to root, its invalid
//    if root!.val <= minValue || root!.val >= maxValue {
//        return false
//    }
//    //1. root.left max value needs to be less than root value
//    //2. root.right min value needs to be greater than root value
//    return checkBst(root?.left, minValue: minValue, maxValue: root!.val) &&
//        checkBst(root?.right, minValue: root!.val, maxValue: maxValue)
//}
//
//func isValidBST(_ root: TreeNode?) -> Bool {
//    //Int.min is the smallest value on swift, Int.max is the largest value on swift
//    //if the root is less than int.min or greater than int.max, we know this tree is invalid
//    //if its valid on the first tier, then the recursive calls within checkBst will make sure the rest of the branch root values are valid
//    return checkBst(root, minValue: Int.min, maxValue: Int.max)
//}
