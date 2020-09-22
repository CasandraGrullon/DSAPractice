import UIKit

//https://leetcode.com/problems/remove-nth-node-from-end-of-list/
//Example:
//Given linked list: 1->2->3->4->5, and n = 2.
//After removing the second node from the end, the linked list becomes 1->2->3->5.

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard head != nil else { return nil }
    //1. add to stack
    var stack = [ListNode?]()
    var node = head
    while let current = node {
        stack.append(current)
        node = current.next
    }
    //2. find the index of stack where stack.count - n == index
    guard n > stack.count else {
        return nil
    }
    for index in 0..<stack.count {
        if index == stack.count - n {
            stack.remove(at: index)
        }
    }
    //3. reassign next values
    var i = 0
    while i < stack.count && i + 1 < stack.count {
        stack[i]?.next = stack[i + 1]
        i += 1
    }
    
    return stack[0]
}


    func printList(head: ListNode?) {
        var head = head
        while let currentNode = head {
            print(currentNode.val)
            head = currentNode.next
        }
    }


let head = ListNode(1)
let two = ListNode(2)
let three = ListNode(3)
let four = ListNode(4)
let five = ListNode(5)
head.next = two
//two.next = three
//three.next = four
//four.next = five
removeNthFromEnd(head, 1)
printList(head: head)
