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
    guard let root = root else {return []}
    //2. if there are no children
    if root.left == nil && root.right == nil {
        return ["\(root.val)"]
    }
    //3. if there are children
    if let left = root.left {
        results.append(contentsOf: binaryTreePaths(left).map({"\(root.val)->\($0)"}))
    }
    if let right = root.right {
        results.append(contentsOf: binaryTreePaths(right).map({"\(root.val)->\($0)"}))
    }
    return results
}
func checkChild(_ root: TreeNode?) -> [String] {
    var result = [String]()
    
    guard let root = root else {
        return [""]
    }
    
    if let left = root.left {
        let leftResult = "\(root.val) -> \(left.val)"
        result.append(leftResult)
    }
    if let right = root.right {
        let rightResult = "\(root.val) -> \(right.val)"
        result.append(rightResult)
    }
    if root.left == nil && root.right == nil {
        result = ["\(root.val)"]
    }
    
    return result
}

var root = TreeNode(1)
var left = TreeNode(2)
var right = TreeNode(3)
root.left = left
root.right = right
left.right = TreeNode(5)
left.left = TreeNode(6)
print(binaryTreePaths(root))
