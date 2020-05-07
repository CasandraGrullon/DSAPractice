import UIKit

// problem 1
// discuss the four sorting algorithms we did in class: Bubble sort, Insertion sort, Quick sort and Merge sort
// desciption of how they work e.g which uses divide and conquer, which uses a pivot
// runtime complexity,
// space complexity,
// https://bigocheatsheet.com

/*
 bubble sort --> runtime: O(n ^ 2) quadratic space: O(1) constant because it uses an inout function
 - worst sorting method because of its slow run time.
 - uses two for loops to iterate through an array.
 - if value i is greater than value j, the values are swapped.
 - re enters for loops until the entire array is sorted.
 */

// problem 2
// implement the following binary tree and print the nodes such that the output is
// Encyclopedia, Science, Culture, Art and Craft
/*
 
              Encyclopedia
                   / \
          Science     Culture
                        /  \
                    Art     Craft
*/
class BinaryTreeNode<T> {
    var value: T
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    init(_ value: T) {
        self.value = value
    }
}

let root = BinaryTreeNode<String>("Encyclopedia")
let twoNode = BinaryTreeNode<String>("Science")
let threeNode = BinaryTreeNode<String>("Culture")
let fourNode = BinaryTreeNode<String>("Art")
let fiveNode = BinaryTreeNode<String>("Craft")
root.leftChild = twoNode
root.rightChild = threeNode
threeNode.leftChild = fourNode
threeNode.rightChild = fiveNode

struct Queue<T> {
    var elements = [T]()
    var peek: T? {
        return elements.first
    }
    var isEmpty: Bool {
        return elements.isEmpty
    }
    var count: Int {
        return elements.count
    }
    mutating func enqueue(item: T) {
        elements.append(item)
    }
    mutating func dequeue() -> T? {
        guard !isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
    
}

extension BinaryTreeNode {
    func breadthFirstTraversal(visit: (BinaryTreeNode) -> ()) {
        var queue = Queue<BinaryTreeNode>()
        visit(self)
        queue.enqueue(item: self)
        
        while let node = queue.dequeue() {
            if let leftChild = node.leftChild {
                visit(leftChild)
                queue.enqueue(item: leftChild)
            }
            if let rightChild = node.rightChild {
                visit(rightChild)
                queue.enqueue(item: rightChild)
            }
        }
        
    }
}
root.breadthFirstTraversal { (node) in
    print(node.value, terminator: " ")
}
print("\n")


// problem 3
// https://leetcode.com/problems/sort-an-array/ // [5 3 2 0]

//class Solution {

//}
    func merge(_ leftArray: [Int], _ rightArray: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        var resultsArray = [Int]()
        
        while leftIndex < leftArray.count && rightIndex < rightArray.count {
            let leftElement = leftArray[leftIndex]
            let rightElement = rightArray[rightIndex]
            
            if leftElement < rightElement {
                resultsArray.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                resultsArray.append(rightElement)
                rightIndex += 1
            } else {
                resultsArray.append(leftElement)
                leftIndex += 1
                resultsArray.append(rightElement)
                rightIndex += 1
            }
        }
        
        if leftIndex < leftArray.count {
            resultsArray.append(contentsOf: leftArray[leftIndex...])
        }
        if rightIndex < rightArray.count {
            resultsArray.append(contentsOf: rightArray[rightIndex...])
        }
        return resultsArray
    }
func sortArray(_ nums: [Int]) -> [Int] {
    guard nums.count > 1 else {
        return nums
    }
    let middleIndex = nums.count / 2
    let leftArray = sortArray(Array(nums[..<middleIndex]))
    let rightArray = sortArray(Array(nums[middleIndex...]))
    
    return merge(leftArray, rightArray)
}
let array = [5, 3, 2, 0]
let sorted = sortArray(array)
print(sorted)
let array2 = [-1,2,-8,-10]
let sorted2 = sortArray(array2)
print(sorted2)


// problem 4
// https://leetcode.com/problems/find-words-that-can-be-formed-by-characters/

    func countCharacters(_ words: [String], _ chars: String) -> Int {
        var count = 0
        var characterDict = Dictionary[Character: Int]()
        
        for char in chars {
            characterDict[char] += 1
        }
        for word in words {
            
        }
        
        return count
    }
let words = ["cat", "hat", "bt", "tree"]
let characters = "atach"
let answer = countCharacters(words, characters)
print(answer)


// questions
/*
 
 binary search
 
 */

// problem: https://leetcode.com/problems/binary-search/
func search(_ nums: [Int], _ target: Int) -> Int {
    var range 
    let middleIndex = range.lowerbound + (range.upperbound - range.lowerbound) / 2
    
    if nums[middleIndex] == target {
        return middleIndex
    } else if nums[middleIndex] > target {
        return search(nums[range.lowerbound..<middleIndex], target)
    } else if array[middleIndex] < target {
        return (nums[middleIndex + 1 ..< range.upperbound], target)
    }
    return -1
}
var nums = [-1,0,3,5,9,12]
var target = 9
let answer2 = search(nums, target)
print(answer2)
