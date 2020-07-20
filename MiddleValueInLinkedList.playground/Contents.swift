import UIKit

//https://leetcode.com/problems/middle-of-the-linked-list/

//Given a non-empty, singly linked list with head node head, return a middle node of linked list.
//If there are two middle nodes, return the second middle node.
//Example 1:
//Input: [1,2,3,4,5]
//Output: Node 3 from this list (Serialization: [3,4,5])
//The returned node has value 3.  (The judge's serialization of this node is [3,4,5]).
//Note that we returned a ListNode object ans, such that:
//ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, and ans.next.next.next = NULL.
//Example 2:
//
//Input: [1,2,3,4,5,6]
//Output: Node 4 from this list (Serialization: [4,5,6])
//Since the list has two middle nodes with values 3 and 4, we return the second one.



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func middleNode(_ head: ListNode?) -> ListNode? {
    //1. no head
    guard let head = head else { return nil }
    var listArray = [ListNode]()
    listArray.append(head)
    
    //2. if there are other values in list
    if let next = head.next {
        listArray.append(contentsOf: makeListArray(head: next))
        let index = listArray.count / 2
        return listArray[index]
    } else {
        return head
    }
}
func makeListArray(head: ListNode?) -> [ListNode] {
    guard head != nil else {
        return []
    }
    var results = [ListNode]()
    var node = head
    
    while node != nil {
        results.append(node ?? ListNode(-100))
        node = node?.next
    }
    return results
}

var one = ListNode(1)
var two = ListNode(2)
var three = ListNode(3)
var four = ListNode(4)
var five = ListNode(5)
one.next = two
two.next = three
three.next = four
four.next = five
five.next = ListNode(6)
print(middleNode(one) ?? ListNode(-200))
