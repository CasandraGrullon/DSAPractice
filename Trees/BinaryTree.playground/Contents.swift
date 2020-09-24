import UIKit

//Binary Tree -> Breadth Traversal
//an abstract data type
//the components of a tree are the root node, child node

//a node is referred to as a leaf -> it does not have any children

//there are two ways to traverse a binary tree
//1. breadth-first traversal: uses a queue to keep track of visited nodes
//runtime: O(n) because it uses a while loop
//2. depth-first traversal : in-order, post-order, pre-order

class BinaryTreeNode<T> {
    var value: T
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    init(_ value: T) {
        self.value = value
    }
}

struct Queue<T> {
    private var elements = [T]()
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public var peek: T? {
        return elements.first
    }
    
    public mutating func enqueue(_ item: T) {
        elements.append(item) // O(1)
    }
    public mutating func dequeue() -> T? {
        guard !elements.isEmpty else {return nil}
        return elements.removeFirst() //O(n)
    }
}

/*
 root
1
/   \
 2     3
 / \
 4   5
 */

let rootNode = BinaryTreeNode<Int>(1)
let twoNode = BinaryTreeNode<Int>(2)
let threeNode = BinaryTreeNode<Int>(3)
let fourNode = BinaryTreeNode<Int>(4)
let fiveNode = BinaryTreeNode<Int>(5)

rootNode.leftChild = twoNode
rootNode.rightChild = threeNode
twoNode.leftChild = fourNode
twoNode.rightChild = fiveNode

//as we visit each level of the tree, we use a queue

extension BinaryTreeNode {
    //using a closure to capture the value of the visited nodes
    func breadthFirstTraversal(visit: (BinaryTreeNode) -> () ) {
        //queue will keep track of visited nodes by dequeuing ones that were already visited
        var queue = Queue<BinaryTreeNode>()
        visit(self) // self = root node    //capturing the current node
        
        queue.enqueue(self) //adding root node to the queue
        
        while let node = queue.dequeue() {
            //check for left child and enqueue
            if let leftChild = node.leftChild {
                visit(leftChild)
                queue.enqueue(leftChild)
            }
            //check for right child and enqueue
            
            if let rightChild = node.rightChild {
                visit(rightChild)
                queue.enqueue(rightChild)
            }
            
        }
        
        
    }
}


print("breadth-first-traversal")
rootNode.breadthFirstTraversal { (node) in
    print(node.value, terminator: " ")
}
print("\n")

//Binary Tree - Depth First Traversals
//definition: at most can have 2 children
/* Three ways to use depth first traversal:
 1. In order Traversal
 2. Pre-order Traversal
 3. Post Order Traversal
*/

extension BinaryTreeNode {
    //in order traversal
    /*
     rules:
     1. left child recursively
     2. visit node
     3. right child recursively
     */
    func inOrderTraversal(visit: (BinaryTreeNode) -> ()) {
        leftChild?.inOrderTraversal(visit: visit)
        visit(self)
        rightChild?.inOrderTraversal(visit: visit)
    }
    func preOrderTraversal(visit: (BinaryTreeNode) -> ()) {
        visit(self)
        leftChild?.preOrderTraversal(visit: visit)
        rightChild?.preOrderTraversal(visit: visit)
    }
    func postOrderTraversal(visit: (BinaryTreeNode) -> ()){
        leftChild?.postOrderTraversal(visit: visit)
        rightChild?.postOrderTraversal(visit: visit)
        visit(self)
    }
}
//create a tree
let treeNode = BinaryTreeNode<Int>(1)
let two2Node = BinaryTreeNode<Int>(2)
let three3Node = BinaryTreeNode<Int>(3)
let four4Node = BinaryTreeNode<Int>(4)
let five5Node = BinaryTreeNode<Int>(5)
let sixNode = BinaryTreeNode<Int>(6)
let sevenNode = BinaryTreeNode<Int>(7)
treeNode.leftChild = twoNode
treeNode.rightChild = threeNode
twoNode.leftChild = fourNode
twoNode.rightChild = fiveNode
threeNode.leftChild = sixNode
threeNode.rightChild = sevenNode

//test in-order traversal
//expected output: 4 2 5 1 3
print("in order")
treeNode.inOrderTraversal { (node) in
    print(node.value, terminator: " ")
}
print("\n")
print("pre order")
treeNode.preOrderTraversal { (node) in
    print(node.value, terminator: " ")
}
print("\n")
print("post order")
treeNode.postOrderTraversal { (node) in
    print(node.value, terminator: " ")
}
