import UIKit

//https://leetcode.com/problems/leaf-similar-trees/


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
//space: O(n) runtime: O(n)
// tree problems:
// recursion, traversal
func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    //1. traverse through the root1 branches
    //2. store root1 leaves in array
    //3. traverse through root2 branches
    //4. store root2 leaves in array
    //5. compare arrays
    //let array1 = root1?.leafArray()
    //let array2 = root2?.leafArray()
    let array1 = leafArray(root: root1)
    let array2 = leafArray(root: root2)
    
    return array1 == array2
    //better solution instead of returning an array return one leaf at a time and compare
}
func leafArray(root: TreeNode?) -> [Int] {
    var result = [Int]()
    
    if root?.left == nil && root?.right == nil {
        result.append(root?.val ?? -1)
    } else {
        if let left = root?.left {
            result.append(contentsOf: leafArray(root: left))
        }
        if let right = root?.right {
            result.append(contentsOf: leafArray(root: right))
        }
    }
    
    return result
}
extension TreeNode {
    func leafArray() -> [Int] {
        var result = [Int]()
        
        if self.left == nil && self.right == nil {
            result.append(self.val)
        } else {
            if let left = self.left {
                result.append(contentsOf: left.leafArray())
            }
            if let right = self.right {
                result.append(contentsOf: right.leafArray())
            }
        }
        
        return result
    }
}
let root1 = TreeNode(1)
root1.left = TreeNode(2)
root1.right = TreeNode(3)
let root2 = TreeNode(1)
root2.left = TreeNode(2)
root2.right = TreeNode(3)
leafSimilar(root1, root2)
