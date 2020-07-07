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
    var valueSet: Set<Int> = []
    guard root != nil else {return true}
//    root.inOrderTraversal { (node) in
//        valueSet.insert(node.val)
//    }
    var current = root
    valueSet.insert(current?.val ?? -1)
    if let left = current?.left {
        valueSet.insert(left.val)
        
    }
    if let right = current?.right {
        
    }
    
    if valueSet.count > 1 {
        return false
    } else {
        return true
    }
    
}

//extension TreeNode {
//    func inOrderTraversal(visit: (TreeNode) -> ()) {
//        left?.inOrderTraversal(visit: visit)
//        visit(self)
//        right?.inOrderTraversal(visit: visit)
//    }
//}
//func traverseTree(root: TreeNode) -> [TreeNode] {
//    var results = [TreeNode]()
//    results.append(root)
//
//
//    if var left = root.left {
//    results.append(left)
//    traverseTree(root: left)
//    }
//    if let right = root.right {
//    results.append(right)
//    traverseTree(root: right)
//    }
//    return results
//}

let root = TreeNode(2)
let right = TreeNode(2)
let left = TreeNode(5)
left.left = TreeNode(2)
right.right = TreeNode(2)
isUnivalTree(root)
