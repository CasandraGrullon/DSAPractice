import UIKit

//Valid Palindrome
func isPalindrome(_ s: String) -> Bool {
    var reversedWord = String()
    var sCopy = s
    
    while sCopy.count > 0 {
        if let letter = sCopy.popLast() {
            if letter.isLetter || letter.isNumber {
                reversedWord.append(letter)
            }
        }
    }
    
    for char in s {
        if char.isLetter || char.isNumber {
            sCopy.append(char)
        }
    }
    guard reversedWord.count == sCopy.count else {
        return false
    }
    
    if reversedWord.lowercased() == sCopy.lowercased() {
        return true
    } else {
        return false
    }
}
var example = "1b1"
isPalindrome(example)

//Given two binary trees, write a function to check if they are the same or not.
//https://leetcode.com/problems/same-tree/
//Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

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
class Queue<T> {
    var elements = [T]()
    var isEmpty: Bool {
        return elements.isEmpty
    }
    var count: Int {
        return elements.count
    }
    var peek: T? {
        return elements.first
    }
    init(){}
    
    func enqueue(_ x: T?) {
        if let value = x {
            elements.append(value)
        }
        
    }
    func dequeue() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
}

//first we need a way to traverse through the trees
extension TreeNode {
    func breadthFirstTraversal(visit: (TreeNode) -> ()) -> Queue<Int> {
        let q = Queue<TreeNode>()
        let resultQ = Queue<Int>()
        visit(self)
        q.enqueue(self)
        
        while let node = q.dequeue() {
            if let leftChild = node.left {
                visit(leftChild)
                q.enqueue(leftChild)
                resultQ.enqueue(leftChild.val)
            }
            if let rightChild = node.right {
                visit(rightChild)
                q.enqueue(rightChild)
                resultQ.enqueue(rightChild.val)
            }
        }
        return resultQ
    }
}

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    //traverse through both p and q
    var result = Bool()
    let pQueue = p?.breadthFirstTraversal(visit: { (node) in
        return
    })
    let qQueue = q?.breadthFirstTraversal(visit: { (node) in
        return
    })
    
    guard pQueue?.count == qQueue?.count else {
        return false
    }
    while pQueue?.count ?? -1 > 0 && qQueue?.count ?? -1 > 0 {
        if let dequeue = pQueue?.dequeue() {
            if qQueue?.peek == dequeue {
                result = true
                qQueue?.dequeue()
            } else {
                result = false
            }
            
        }
    }
    return result
}
//leet code solution
func isSameTree2(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if(p == nil && q == nil) {return true}
    if(p == nil || q == nil) {return false}
    if(p!.val != q!.val) {return false}
    return isSameTree2(p!.left, q!.left) && isSameTree2(p!.right, q!.right)
}
var tree1 = TreeNode(1)
tree1.left = TreeNode(2)
tree1.right = TreeNode(3)
var tree2 = TreeNode(1)
tree2.left = TreeNode(2)
tree2.right = TreeNode(3)
isSameTree2(tree1, tree2)

//
class BinaryTreeNode<T> {
    var leftBranch: BinaryTreeNode?
    var rightBranch: BinaryTreeNode?
    var value: T
    
    init(_ value: T){
        self.value = value
    }
    
}

class Queue2<T> {
    var elements = [T]()
    
    var top: T? {
        return elements.first
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    init() {
        
    }
    
    func enqueue(_ element: T) {
        elements.append(element)
    }
    
    func dequeue()-> T? {
        guard !isEmpty else {return nil}
        return elements.removeFirst()
    }
    
}

extension BinaryTreeNode {
    func breadthFirstTraversal(visit: (BinaryTreeNode) -> ()) {
        let queue = Queue2<BinaryTreeNode>()
        visit(self) // root = 1 binarytreenode.val = 1
        queue.enqueue(self) // [1]
        
        while let branch = queue.dequeue() {
            if let leftBranch = branch.leftBranch {
                visit(leftBranch)
                queue.enqueue(leftBranch)
            }
            if let rightBranch = branch.rightBranch {
                visit(rightBranch)
                queue.enqueue(rightBranch)
            }
        }
        
    }
    func inOrderTraversal(visit: (BinaryTreeNode) -> ()) {
        leftBranch?.inOrderTraversal(visit: visit)
        visit(self)
        rightBranch?.inOrderTraversal(visit: visit)
    }
    func preOrderTraversal(visit: (BinaryTreeNode)-> ()) {
        visit(self)
        leftBranch?.preOrderTraversal(visit: visit)
        rightBranch?.preOrderTraversal(visit: visit)
        
        
    }
    func postOrderTraversal(visit: (BinaryTreeNode)-> ()) {
        leftBranch?.preOrderTraversal(visit: visit)
        rightBranch?.preOrderTraversal(visit: visit)
        visit(self)
    }
}


var tree = BinaryTreeNode(1)
var leftBranch = BinaryTreeNode(2)
tree.leftBranch = leftBranch
tree.rightBranch = BinaryTreeNode(3)
leftBranch.leftBranch = BinaryTreeNode(4)
leftBranch.rightBranch = BinaryTreeNode(5)


tree.breadthFirstTraversal { (branch) in
    print(branch.value, terminator: ",")
}
print("\n")

tree.inOrderTraversal { (branch) in
    print(branch.value, terminator: ",")
}

print("\n")

tree.preOrderTraversal { (branch) in
    print(branch.value, terminator: ",")
}

print("\n")

tree.postOrderTraversal { (branch) in
    print(branch.value, terminator: ",")
}

//Maximum Depth of Binary Tree
func maxDepth(_ root: TreeNode?) -> Int {
    //first need to traverse through the treenode
    guard let root = root else {
        return 0
    }
    let leftBranch = maxDepth(root.left)
    let rightBranch = maxDepth(root.right)
    return max(leftBranch, rightBranch) + 1
}

var tree3 = TreeNode(3)
var left = TreeNode(9)
var right = TreeNode(20)
tree3.left = left
tree3.right = right
right.left = TreeNode(15)
right.right = TreeNode(7)
maxDepth(tree3) // 3

//https://leetcode.com/problems/path-sum/
func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
    let leftBranch = root?.left
    let rightBranch = root?.right
    var treeSum = Int()
    if let rootVal = root?.val {
        treeSum += rootVal // 5
    }
    
    while leftBranch != nil || rightBranch != nil {
        
        if var leftBranch = leftBranch {
            if leftBranch.val + treeSum < sum {
                treeSum += leftBranch.val // 5 + 4
                
                if let left = leftBranch.left {
                    leftBranch = left //11
                } else if let right = leftBranch.right {
                    leftBranch = right//nil
                }
                
            }
        } else if var rightBranch = rightBranch {
            if rightBranch.val + treeSum < sum {
                treeSum += rightBranch.val // 5 + 8
                
                if let left = rightBranch.left {
                    rightBranch = left //13
                } else if let right = rightBranch.right {
                    rightBranch = right //4
                }
            }
        }

    }
    
    return treeSum == sum
    
}
var sumNode1 = TreeNode(5)
var sumNode2 = TreeNode(4)
var sumNode3 = TreeNode(11)
var sumNode4 = TreeNode(7)
var sumNode5 = TreeNode(2)

var sumNode6 = TreeNode(8)
var sumNode7 = TreeNode(13)
var sumNode8 = TreeNode(4)
var sumNode9 = TreeNode(1)

sumNode1.left = sumNode2
sumNode1.right = sumNode6
sumNode2.left = sumNode3
sumNode3.left = sumNode4
sumNode3.right = sumNode5

sumNode6.left = sumNode7
sumNode6.right = sumNode8
sumNode8.right = sumNode9

hasPathSum(sumNode1, 22)
