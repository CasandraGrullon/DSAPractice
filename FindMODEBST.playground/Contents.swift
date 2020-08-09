import UIKit

//https://leetcode.com/problems/find-mode-in-binary-search-tree/
//Given a binary search tree (BST) with duplicates, find all the mode(s) (the most frequently occurred element) in the given BST.
//
//Assume a BST is defined as follows:
//The left subtree of a node contains only nodes with keys less than or equal to the node's key.
//The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
//Both the left and right subtrees must also be binary search trees.
//For example:
//Given BST [1,null,2,2],
//
//   1
//    \
//     2
//    /
//   2
//return [2]

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
//my solution
func findMode(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    var result = [Int]()
    var treeArray = [Int]()
    var freqDict = [Int: Int]()
    
    if let value = root?.val {
        treeArray.append(value)
    }
    if let left = root?.left {
        treeArray.append(contentsOf: makeArray(left))
    }
    if let right = root?.right {
        treeArray.append(contentsOf: makeArray(right))
    }
    
    for num in treeArray {
        if let value = freqDict[num] {
            freqDict[num] = value + 1
        } else {
            freqDict[num] = 1
        }
    }
    let maxCount = Array(freqDict.values).max()!
    let keys = freqDict.filter {$0.value == maxCount}
    result.append(contentsOf: keys.keys)
    return result
}
func makeArray(_ root: TreeNode?) -> [Int] {
    var treeArray = [Int]()
    if let value = root?.val {
        treeArray.append(value)
    }
    if let left = root?.left {
        treeArray.append(left.val)
    }
    if let right = root?.right {
        treeArray.append(right.val)
    }
    return treeArray
}
//leet code solution
func findMode2(_ root: TreeNode?) -> [Int] {
    var queue: [TreeNode?] = []
    queue.append(root)
    var dict: [Int: Int] = [:]
    
    //1. traverse through the queue
    while !queue.isEmpty {
        if let node = queue.removeFirst() {
            
            //2. populate dictionary
            if let isPresent = dict[node.val] {
                dict[node.val] = isPresent + 1
            } else {
                dict[node.val] = 1
            }
            //3. add left and right branches if they exist to the queue
            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
            //4. once the values run out, the queue ends
        }
    }
    //5. find the max value in the dict
    let mode = dict.values.max()
    var result: [Int] = []
    //6. append max value to the result
    for (key, value) in dict {
        if value == mode {
            result.append(key)
        }
    }
    return result
}
var root = TreeNode(1)
var left = TreeNode(2)
var leftRight = TreeNode(2)
root.left = left
left.right = leftRight
findMode2(root)
findMode(root)
var root2 = TreeNode(1)
root2.left = TreeNode(2)
findMode(root2)
var root3 = TreeNode(2)
var left3 = TreeNode(3)
var leftLeft1 = TreeNode(4)
var leftLeft2 = TreeNode(5)
var leftLeft3 = TreeNode(6)
root3.left = left3
left3.left = leftLeft1
leftLeft1.left = leftLeft2
leftLeft2.left = leftLeft3
findMode2(root3)
