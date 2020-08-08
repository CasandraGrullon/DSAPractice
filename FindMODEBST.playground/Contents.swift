import UIKit

//https://leetcode.com/problems/find-mode-in-binary-search-tree/
//Given a binary search tree (BST) with duplicates, find all the mode(s) (the most frequently occurred element) in the given BST.
//
//Assume a BST is defined as follows:
//The left subtree of a node contains only nodes with keys less than or equal to the node's key.
//The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
//Both the left and right subtrees must also be binary search trees.
//For example:
//Given BST [1,null,2,2],
//
//   1
//    \
//     2
//    /
//   2
//return [2]

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
//my solution
func findMode(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
        return []
    }
    var result = [Int]()
    var treeArray = createArray(root)
    var freqDict = [Int: Int]()
    
    if let left = root?.left {
        treeArray.append(contentsOf: createArray(left))
    }
    if let right = root?.right {
        treeArray.append(contentsOf: createArray(right))
    }
    
    for num in treeArray {
        print("num: \(num)")
        if let value = freqDict[num] {
            freqDict[num] = value + 1
        } else {
            freqDict[num] = 1
        }
    }
    print("dict: \(freqDict)")
    let maxCount = Array(freqDict.values).max()!
    let keys = freqDict.filter {$0.value == maxCount}
    print(keys)
    result.append(contentsOf: keys.keys)
    
    return result
}
func createArray(_ root: TreeNode?) -> [Int] {
    var array = [Int]()
    if root != nil {
        if let value = root?.val {
            array.append(value)
        }
    }
    if let left = root?.left?.val {
        array.append(left)
    }
    if let right = root?.right?.val {
        array.append(right)
    }
    return array
}
//leet code solution
func findMode2(_ root: TreeNode?) -> [Int] {
    var dict: [Int:Int] = [:]
    //5. create the dictionary
    createFrequencyDictionary(root, dict: &dict)
    
    //6. if its an empty dict we know our root is empty
    if dict.isEmpty { return [] }
    
    //7. max count is a built in function to grab the highest value in an array- in this case the highest value in the dictionary should be 2 (count not key)
    let maxCount = Array(dict.values).max()!
    //8. return the key where the value == max count
    return Array(dict.keys).filter { dict[$0] == maxCount }
}

func createFrequencyDictionary(_ root: TreeNode?, dict: inout [Int:Int]) {
    //1. make sure root is not nil if it is this function would return an empty dict
    if root != nil {
        //2. create a dictionary key of the root value and the value of its count
        dict[root!.val, default: 0] += 1
        //3. do the same for the left branch of the root using recursion
        createFrequencyDictionary(root?.left, dict: &dict)
        //4. and the right branch
        createFrequencyDictionary(root?.right, dict: &dict)
    }
}
var root = TreeNode(1)
var left = TreeNode(2)
var leftRight = TreeNode(2)
root.left = left
left.right = leftRight
//findMode2(root)
findMode(root)
var root2 = TreeNode(1)
root2.left = TreeNode(2)
findMode(root2)
