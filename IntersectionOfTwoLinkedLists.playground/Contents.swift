import UIKit

//https://leetcode.com/problems/intersection-of-two-linked-lists/

//Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
//Output: Reference of the node with value = 8
//Input Explanation: The intersected node's value is 8 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,6,1,8,4,5]. There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    guard headA != nil || headB != nil else {
        return nil
    }
    var arrayA = [Int]()
    var arrayB = [Int]()
    
    var head1 = headA
    var head2 = headB
    var answer: ListNode?
    
    while head1 != nil {
        arrayA.append(head1!.val)
        head1 = head1?.next
    }
    while head2 != nil {
        arrayB.append(head2!.val)
        head2 = head2?.next
    }
    var current = 0
    var previous = current - 1
    var next = current + 1
    var value = Int()
    
    if arrayA[current] == arrayB[current] && arrayA[previous] == arrayB[previous] && arrayA[next] == arrayB[next] {
        value = arrayA[current]
    } else {
        current += 1
    }
    print(value)
    return answer
}

var listAHead = ListNode(4)
var a1 = ListNode(1)
listAHead.next = a1
var listBhead = ListNode(5)
var b6 = ListNode(6)
var b1 = ListNode(1)
listBhead.next = b6
b6.next = b1
var intersection = ListNode(8)
var int4 = ListNode(4)
var int5 = ListNode(5)
intersection.next = int4
int4.next = int5
a1.next = intersection
b1.next = intersection
getIntersectionNode(listAHead, listBhead)
