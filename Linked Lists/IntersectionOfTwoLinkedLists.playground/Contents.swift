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
    var stackA = [ListNode]()
    var stackB = [ListNode]()
    
    //1. turn lists into arrays
    var itr = headA
    while itr != nil{
        stackA.append(itr!)
        itr = itr?.next
    }
    itr = headB
    while itr != nil{
        stackB.append(itr!)
        itr = itr?.next
    }
    
    var answer: ListNode?
    while !stackA.isEmpty && !stackB.isEmpty{
        let A = stackA.removeLast()
        let B = stackB.removeLast()
        //print("A: \(A.val), B: \(B.val)")
        //while a and b are the same, we replace the value of answer
        if A === B {
            print("if A: \(A.val), B: \(B.val)")
            answer = A
        } else {
            //once a and b are not the same, we break the loop and return the last value of answer
            print("else A: \(A.val), B: \(B.val)")
            print("answer: \(answer?.val)")//8
            break
        }
    }
    print(answer?.val)
    return answer
}
let a = ListNode(4)
let a1 = ListNode(1)
let int8 = ListNode(8)
let int4 = ListNode(4)
let int5 = ListNode(5)
let b = ListNode(5)
let b6 = ListNode(6)
let b1 = ListNode(1)
int8.next = int4
int4.next = int5
a.next = a1
a1.next = int8
b.next = b6
b6.next = b1
b1.next = int8
getIntersectionNode(a, b)
