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
    guard let head1 = headA, let head2 = headB else {
        return nil
    }
    
}

