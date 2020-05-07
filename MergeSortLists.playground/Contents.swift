import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var mergedList: ListNode?
    
    var currentNode1 = l1
    var currentNode2 = l2
    var lastNode: ListNode?
    
    //assign the first value of mergelist
    if let node1 = currentNode1?.val, let node2 = currentNode2?.val {
        if node1 < node2 {
            mergedList = currentNode1
            lastNode = currentNode1
            currentNode1 = currentNode1?.next
        } else if node1 > node2 {
            mergedList = currentNode2
            lastNode = currentNode2
            currentNode2 = currentNode2?.next
        } else {
            mergedList = currentNode1
            lastNode = currentNode2
            mergedList?.next = currentNode2
            currentNode1 = currentNode1?.next
            currentNode2 = currentNode2?.next
        }
    }

    // currentNode1 = 1 -> 2 -> 4
    // currentNode2 = 1 -> 2 -> 3
    //mergedList = 1 -> 1 -> 3 -> 4
    
    while currentNode1?.next != nil && currentNode2?.next != nil {
        if let node1 = currentNode1?.val, let node2 = currentNode2?.val {
            if node1 < node2 {
                lastNode?.next = currentNode1
                lastNode = currentNode1
            } else if node1 > node2 {
                lastNode?.next = currentNode2
                lastNode = currentNode2
            } else {
                lastNode?.next = currentNode1
                lastNode = currentNode2
            }
        }
    }
    //if there are nil values in either list, append the rest of other list to results
    
    return mergedList
}

func traverseList(head: ListNode) {
    var currentNode = head
    while currentNode.next != nil {
        print(currentNode.val)
        if let next = currentNode.next {
            currentNode = next
        }
        
    }
    print(currentNode.val)
}

var node1A = ListNode(1)
var node2A = ListNode(2)
var node4A = ListNode(4)
node1A.next = node2A
node2A.next = node4A
//traverseList(head: node1A)
var node1B = ListNode(1)
var node2B = ListNode(2)
var node3B = ListNode(3)
node1B.next = node2B
node2B.next = node3B
//traverseList(head: node1B)
let merged = mergeTwoLists(node1A, node1B)
traverseList(head: merged!)
