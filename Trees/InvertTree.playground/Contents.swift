import UIKit

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

func invertTree(_ root: TreeNode?) -> TreeNode? {
    //not my solution
    guard let root = root else {
        return nil
    }
    let right = invertTree(root.right)
    let left = invertTree(root.left)
    root.left = right
    root.right = left
    
    return root
}

let root = TreeNode(4)
let left = TreeNode(2)
let right = TreeNode(7)
root.left = left
left.left = TreeNode(1)
left.right = TreeNode(3)
root.right = right
right.left = TreeNode(6)
right.right = TreeNode(9)
invertTree(root)
