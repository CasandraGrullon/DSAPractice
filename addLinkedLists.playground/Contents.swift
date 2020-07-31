import UIKit

//https://leetcode.com/problems/add-two-numbers/

//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8
//Explanation: 342 + 465 = 807


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//Solution solves 1560 / 1563 test cases :(
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    //1. convert lists to arrays -> [2,4,3], [5,6,4]
    //2. reverse arrays -> [3,4,2], [4,6,5]
    //3. turn arrays into single digits -> 342, 465
    //4. add the numbers -> 342 + 465 = 807
    //5. reverse results -> 708
    //6. turn the result to a linked list -> 7 -> 0 -> 8
    var array1 = [Int]()
    var array2 = [Int]()
    
    guard l1 != nil, l2 != nil else {
        return nil
    }
    
    var head1 = l1
    var head2 = l2
    
    //1.
    while head1 != nil {
        array1.append(head1!.val)
        head1 = head1?.next
    }
    while head2 != nil {
        array2.append(head2!.val)
        head2 = head2?.next
    }
    //2.
    array1.reverse()
    array2.reverse()
    //3.
    let number1 = array1.reduce(0, { $0 * 10 + $1 })
    let number2 = array2.reduce(0, { $0 * 10 + $1 })
    //4.
    let sum = number1 + number2
    var sumArray = [Int]()
    
    for num in String(sum) {
        let number = Int(String(num))!
        sumArray.append(number)
    }
    
    var result: ListNode?
    var head: ListNode?
    
    while !sumArray.isEmpty {
        let last = sumArray.removeLast()
        if result == nil {
            result = ListNode(last)
            head = result
        } else {
            result?.next = ListNode(last)
            result = result?.next
        }
    }
    return head
}

var list1 = ListNode(2)
var list1b = ListNode(4)
list1.next = list1b
list1b.next = ListNode(3)
var list2 = ListNode(5)
var list2b = ListNode(6)
list2.next = list2b
list2b.next = ListNode(4)
addTwoNumbers(list1, list2)

var newList = ListNode(1)
newList.next = ListNode(8)
var newList2 = ListNode(0)
addTwoNumbers(newList, newList2)
