import UIKit

//https://leetcode.com/problems/longest-univalue-path/
//find longest path where values are the same
//ex:
//     5
//    / \
//   4   5
//  / \   \
// 1   1   5
// answer: 2

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
class ListNode {
    var value: Int
    var next: ListNode?
    init(_ value: Int) {
        self.value = value
    }
}

func longestUnivaluePath(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    var leftCount = [Int]()
    var rightCount = [Int]()
    
    if let left = root.left {
        if root.val == left.val {
            leftCount = checkChild(left, value: root.val)
        } else {
            leftCount = checkChild(left, value: left.val)
        }
    }
    if let right = root.right {
        if root.val == right.val {
            rightCount = checkChild(right, value: root.val)
        } else {
            rightCount = checkChild(right, value: right.val)
        }
    }
    
    if leftCount.count > rightCount.count {
        return leftCount.count
    } else if leftCount.count < rightCount.count {
        return rightCount.count
    } else if leftCount.count == rightCount.count {
        return leftCount.count
    } else {
        return 0
    }
}
func checkChild(_ root: TreeNode, value: Int) -> [Int] {
    guard root.val == value else {
        return []
    }
    
    var leftCount = [Int]()
    var rightCount = [Int]()
    
    if let left = root.left {
        if left.val == value {
            leftCount.append(left.val)
            leftCount.append(root.val)
        } else {
            leftCount.removeAll()
        }
    }
    
    if let right = root.right {
        if right.val == value {
            rightCount.append(right.val)
            rightCount.append(root.val)
        } else {
            rightCount.removeAll()
        }
    }
    
    if leftCount.count > rightCount.count {
        return leftCount
    } else if leftCount.count < rightCount.count {
        return rightCount
    } else {
        return []
    }
}

let root2 = TreeNode(1)
root2.left = TreeNode(1)
longestUnivaluePath(root2)//1

let root = TreeNode(5)
let left = TreeNode(4)
let right = TreeNode(5)
let leftLeft = TreeNode(1)
let rightLeft = TreeNode(5)
root.left = left
root.right = right
left.left = leftLeft
right.left = rightLeft
longestUnivaluePath(root)//2

let root3 = TreeNode(1)
let left3 = TreeNode(4)
let right3 = TreeNode(5)
let leftLeft3 = TreeNode(4)
let leftRight3 = TreeNode(4)
let rightLeft3 = TreeNode(5)
root3.left = left3
root3.right = right3
left3.left = leftLeft3
leftRight3.right = leftRight3
right3.left = rightLeft3
longestUnivaluePath(root3)//2

let sample = TreeNode(1)
sample.left = TreeNode(2)
longestUnivaluePath(sample)//0
