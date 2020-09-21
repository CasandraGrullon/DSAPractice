import UIKit

//https://leetcode.com/problems/remove-linked-list-elements/
//Remove all elements from a linked list of integers that have value val.
//Example:
//Input:  1->2->6->3->4->5->6, val = 6
//Output: 1->2->3->4->5
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    guard head != nil else {
        return nil
    }
    var node = head
    var previous: ListNode?
    
    while let current = node {
        if current.val == val {
            node = current.next
            previous?.next = node
        } else {
            previous = current
            node = current.next
        }
    }
    return node
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
let five = ListNode(6)
let six = ListNode(6)
head.next = two
two.next = three
three.next = four
four.next = five
//five.next = six
removeElements(head, 6)
printList(head: head)
//solution did not run in leetcode
//func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
//    guard head != nil else {
//        return nil
//    }
//    if head?.val == val {
//        return nil
//    }
//    //1. make list into an array
//    var listArray = makeListArray(head: head)
//    //2. remove element
//    if !listArray.contains(where: {$0?.val == val}) {
//        return head
//    }
//    for (index, node) in listArray.enumerated() {
//        if node?.val == val {
//            listArray.remove(at: index)
//            listArray.insert(nil, at: index)
//        }
//    }
//    //3. return new list
//    var i = 0
//    var node: ListNode?
//    while i < listArray.count {
//        node = listArray[i]
//        node?.next = listArray[i + 1]
//        i += 1
//    }
//    return node
//}
//func makeListArray(head: ListNode?) -> [ListNode?] {
//    guard head != nil else {
//        return []
//    }
//    var results = [ListNode]()
//    var node = head
//
//    while node != nil {
//        results.append(node ?? ListNode(-100))
//        node = node?.next
//    }
//    return results
//}
