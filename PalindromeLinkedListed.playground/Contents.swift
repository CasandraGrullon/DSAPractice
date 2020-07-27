import UIKit

//Given a singly linked list, determine if it is a palindrome.

//Example 1:
//Input: 1->2
//Output: false

//Example 2:
//Input: 1->2->2->1
//Output: true

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0
        self.next = nil
        
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

func isPalindrome(_ head: ListNode?) -> Bool {
    var result: Set<Bool> = []
    var current = head
    
    while current != nil {
        let reversed = reverseList(current)
        if current?.val == reversed?.val && current?.next?.val == reversed?.next?.val {
            result.insert(true)
            current = current?.next
        } else {
            result.insert(false)
        }
    }
    if result.contains(false) {
        return false
    } else {
        return true
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
var head = ListNode(0)
var next = ListNode(0)
var nextNext = ListNode(2)
var nextNextNext = ListNode(1)
head.next = next
//next.next = nextNext
//nextNext.next = nextNextNext

isPalindrome(head)
