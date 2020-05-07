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
    var reversed = reverseList(head)
    var currentNode = head
    var result = Bool()
    while currentNode != nil {
        if currentNode?.val == reversed?.val && currentNode?.next?.val == reversed?.next?.val{
            result = true
        } else {
            result = false
        }
    }
    return result
}
func reverseList(_ head: ListNode?) -> ListNode? {
    var currentNode = head
    var previousNode: ListNode?
    var nextNode: ListNode?
    
    while currentNode != nil {
        nextNode = currentNode?.next
        currentNode?.next = previousNode
        previousNode?.next = currentNode
        currentNode = nextNode
    }
    return previousNode
}

