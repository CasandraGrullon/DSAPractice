import UIKit

//https://leetcode.com/problems/univalued-binary-tree/
//A binary tree is univalued if every node in the tree has the same value.
//Return true if and only if the given tree is univalued.

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
//Method using extension function
extension TreeNode {
    func inOrderTraversal(visit: (TreeNode) -> ()) {
        left?.inOrderTraversal(visit: visit)
        visit(self)
        right?.inOrderTraversal(visit: visit)
    }
}
func isUnivalTree1(_ root: TreeNode?) -> Bool {
    var valueSet: Set<Int> = []
    
    guard let root = root else {return true}
    
    root.inOrderTraversal { (node) in
        valueSet.insert(node.val)
    }
    
    if valueSet.count > 1 {
        return false
    } else {
        return true
    }
}
//LeetCode solution
func isUnivalTree(_ root: TreeNode?) -> Bool {
    guard let root = root else {return true}

    return checkValues(root, value: root.val)
}
func checkValues(_ root: TreeNode?, value: Int) -> Bool {
    guard let root = root else {return true}
    
    if root.val != value {
        return false
    }
    
    return checkValues(root.left, value: root.val) && checkValues(root.right, value: root.val)
}

let root = TreeNode(9)
let right = TreeNode(9)
let left = TreeNode(9)
root.left = left
root.right = right
left.left = TreeNode(9)
right.right = TreeNode(6)
isUnivalTree(root)
