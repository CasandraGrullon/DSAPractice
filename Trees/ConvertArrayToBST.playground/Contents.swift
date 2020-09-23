import UIKit

//https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/
//Given the sorted array: [-10,-3,0,5,9],
//One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:
//
//      0
//     / \
//   -3   9
//   /   /
// -10  5

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

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    //let sortedArray = nums
    //1. assign the root
    //BST have left < root < right
    
    //MARK:- solution works on playgrounds but not on leetcode
//    let middleIndex = nums.count / 2
//    let root = TreeNode(nums[middleIndex])
//
//    if middleIndex > 0 {
//        let leftSubTree = sortedArrayToBST(Array(nums[0..<middleIndex]))
//        root.left = leftSubTree
//    }
//
//    if (middleIndex + 1) < nums.count {
//        let rightSubTree = sortedArrayToBST(Array(nums[middleIndex+1..<nums.count]))
//        root.right = rightSubTree
//    }
//
//    return root
    //MARK:- Leetcode solution
    return arrayToBST(nums: nums, left: 0, right: nums.count - 1)
}
private func arrayToBST(nums: [Int], left: Int, right: Int) -> TreeNode? {
    if left > right { return nil }

    if left == right {
        return TreeNode(nums[left])
    } else {
        let mid = (left + right) / 2
        let node = TreeNode(nums[mid])
        node.left = arrayToBST(nums: nums, left: left, right: mid - 1)
        node.right = arrayToBST(nums: nums, left: mid + 1, right: right)
        return node
    }
}
extension TreeNode {
    func inOrderTraversal(visit: (TreeNode) -> ()) {
        visit(self)
        left?.inOrderTraversal(visit: visit)
        right?.inOrderTraversal(visit: visit)
    }
}
var array = [-10, -3, 0, 5, 9]
var tree = sortedArrayToBST(array)
tree?.inOrderTraversal(visit: { (node) in
    print(node.val, terminator: " ")
})
print("\n")

