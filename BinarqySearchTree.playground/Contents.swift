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

let root = TreeNode(12)
root.insert(5)
root.insert(32)
root.inOrderTraversal()
root.contains(3)//false
root.contains(32)//true
