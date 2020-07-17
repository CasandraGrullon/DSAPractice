import UIKit

//https://leetcode.com/problems/binary-tree-paths/
//Given a binary tree, return all root-to-leaf paths.
//Note: A leaf is a node with no children.
//Example:
//Input:
//    1
//  /   \
// 2     3
//  \
//   5
//Output: ["1->2->5", "1->3"]
//Explanation: All root-to-leaf paths are: 1->2->5, 1->3


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

func binaryTreePaths(_ root: TreeNode?) -> [String] {
    var results = [String]()
    //1. if root is empty
    guard let root = root else {return [""]}
    //2. if root does not have children
    if let left = root.left, let right = root.right {
        var leftResults = ["\(root.val)"]
        leftResults.append(contentsOf: checkChild(left))
        let leftjoined = leftResults.joined(separator: " -> ")
        results.append(leftjoined)
        
        var rightResults = ["\(root.val)"]
        rightResults.append(contentsOf: checkChild(right))
        let rightjoined = rightResults.joined(separator: " -> ")
        results.append(rightjoined)
    } else if let left = root.left {
        var leftResults = ["\(root.val)"]
        leftResults.append(contentsOf: checkChild(left))
        let leftjoined = leftResults.joined(separator: " -> ")
        results.append(leftjoined)
    } else if let right = root.right {
        var rightResults = ["\(root.val)"]
        rightResults.append(contentsOf: checkChild(right))
        let rightjoined = rightResults.joined(separator: " -> ")
        results.append(rightjoined)
    } else {
        results = ["\(root.val)"]
    }
    
    return results
}
func checkChild(_ root: TreeNode?) -> [String] {
    var result = [String]()
    
    guard let root = root else {
        return [""]
    }
    
    if let left = root.left, let right = root.right {
        let leftResult = "\(root.val) -> \(left.val)"
        result.append(leftResult)
        let rightResult = "\(root.val) -> \(right.val)"
        result.append(rightResult)
    } else if let left = root.left {
        let leftResult = "\(root.val) -> \(left.val)"
        result.append(leftResult)
    } else if let right = root.right {
        let rightResult = "\(root.val) -> \(right.val)"
        result.append(rightResult)
    } else {
        result = ["\(root.val)"]
    }
    
    return result
}

var root = TreeNode(1)
var left = TreeNode(2)
//var right = TreeNode(3)
root.left = left
//root.right = right
left.right = TreeNode(5)
print(binaryTreePaths(root))
