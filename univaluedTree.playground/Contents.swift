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

func isUnivalTree(_ root: TreeNode?) -> Bool {
    // no root
    guard let root = root else {return true}
    var valueSet: Set<Int> = []
    root.inOrderTraversal { (node) in
        valueSet.insert(node.val)
    }
    if valueSet.count > 1 {
        return false
    } else {
        return true
    }
    
}
extension TreeNode {
    func inOrderTraversal(visit: (TreeNode) -> ()) {
        left?.inOrderTraversal(visit: visit)
        visit(self)
        right?.inOrderTraversal(visit: visit)
    }
}

let root = TreeNode(1)
root.left = TreeNode(1)
root.right = TreeNode(2)
isUnivalTree(root)
