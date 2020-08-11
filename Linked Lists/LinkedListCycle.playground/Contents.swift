import UIKit

//https://leetcode.com/problems/linked-list-cycle/
//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//wrong answer, result is always true :(
func hasCycle(_ head: ListNode?) -> Bool {
    var current = head
    var stack = [ListNode]()
    
    
    if let next = current?.next, let curnt = current {
        stack.append(curnt)
        stack.append(next)
    } else {
        return false
    }
    
    guard let tail = stack.popLast() else { return false }
    
    if tail.next == nil {
        return false
    } else {
        return true
    }
    
}
//correct answer
func hasCycle2(_ head: ListNode?) -> Bool {
    var slow = head //3
    print("slow \(slow?.val)")
    var fast = slow?.next //2
    print("fast \(fast?.val)")
    
    while slow != nil && fast != nil {
        if slow === fast {
            return true
        }
        slow = slow?.next //2 -> 0
        print("slow \(slow?.val)")
        fast = fast?.next?.next //-4 -> 0
        print("fast \(fast?.val)")
    }
    
    return false
}

var list1a = ListNode(3)
var list1b = ListNode(2)
var list1c = ListNode(0)
var list1d = ListNode(-4)
list1a.next = list1b
list1b.next = list1c
list1c.next = list1d
list1d.next = list1b
hasCycle(list1a)
hasCycle2(list1a)
