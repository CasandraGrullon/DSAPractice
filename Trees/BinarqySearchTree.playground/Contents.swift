import UIKit

class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var value: Int
    
    init(_ value: Int){
        self.value = value
    }
}
extension TreeNode {
    func insert(_ newValue: Int) {
        if newValue < value { //go left
            if left != nil {
                //if left branch has values, check if the new value is less than or greater than left branch value
                left!.insert(newValue)
            } else {
                //if left side is empty, create a new node and insert
                left = TreeNode(newValue)
            }
            
        } else { //go right
            if right != nil {
                right!.insert(newValue)
            } else {
                right = TreeNode(newValue)
            }
        }
    }
    //search logic
    //1. check current Node (root) to verify target value
    //2. if target is less than current Node value, then search on left branch
    //3. else, search right branch
    func contains(_ targetValue: Int) -> Bool {
        //1. check current Node (root) to verify target value
        if targetValue == value {
            return true
        }
        //2. if target is less than current Node value, then search on left branch, else search right branch
        if targetValue < value { //search left
            if left != nil {
                //repeats visit until the value is found on this side of the tree
                return left!.contains(targetValue)
            } else {
                return false
            }
            
        } else { // search right
            if right != nil {
                return right!.contains(targetValue)
            } else {
                return false
            }
        }
    }
    
    func inOrderTraversal() { // left -> root <- right
        left?.inOrderTraversal()//visit left
        print("\(value)", terminator: " ")//print
        right?.inOrderTraversal()
    }
}



// Deleting from a Binary Search Tree
// function takes in a tree and a value and deletes the value from the tree and returns a modified tree

func delete(_ root: TreeNode?, _ targetValue: Int) -> TreeNode? {
    
    guard let _ = root else {
        return nil
    }
    
    var root = root
    
    //check the target value check if its in the right or left
    if targetValue < root!.value { //left
        //recursive call to keep checking the left branches until we find the target
        root?.left = delete(root?.left, targetValue)
        
    } else if targetValue > root!.value { //right
        //recursive call to keep checking the right branches until we find the target
        root?.right = delete(root?.right, targetValue)
        
    } else { //we found the node
        //scenerio 1: no children
        if root?.right == nil && root?.left == nil {
            root = nil
            return root
        }
            
            //scenerio 2: one child
        else if root?.left == nil {
            root = root?.right
        } else if root?.right == nil {
            root = root?.left
        }
        else {
            //scenerio 3: two children
            //steps:
            //1. find the smallest value from right side of the tree
            let tempNode = minimum(root?.right)
            
            //2. replace the root value with the smallest value we found on the right side
            
            root?.value = tempNode?.value ?? -10000
            
            //3. delete minimum value from its original point on the tree
            root?.right = delete(root?.right, tempNode?.value ?? -10000)
        }
    }
    
    return root // represents the modified tree after deletion
}

//helper function to get the minimum value
func minimum(_ root: TreeNode?) -> TreeNode? {
    //we know the min value of a binary search tree is on the left side
    var currentNode = root
    while let next = currentNode?.left {
        currentNode = next
    }
    return currentNode
}

let root = TreeNode(12)
root.insert(5)
root.insert(32)
//if using inOrderTraversal, if the print order of the values is in ascending order then its a correct Binary Search Tree
//root.inOrderTraversal() // 5 -> 12 -> 32
root.contains(3)//false
root.contains(11)//true
root.insert(15)
root.insert(13)
root.insert(21)
root.insert(40)
root.insert(50)
root.insert(35)
root.insert(65)
root.inOrderTraversal()
print()
delete(root, 50)
root.inOrderTraversal()
