import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


func reverseList(_ head: ListNode?) -> ListNode? {
    var currentNode = head
    var nextNode: ListNode?
    var prevNode: ListNode?
    
    while currentNode != nil {
        nextNode = currentNode?.next
        currentNode?.next = prevNode
        prevNode = currentNode
        currentNode = nextNode
    }
    return prevNode
}

var list = ListNode(1)
var list2 = ListNode(2)
var list3 = ListNode(3)
list.next = list2
list2.next = list3
reverseList(list)
// 3 -> 2 -> 1
