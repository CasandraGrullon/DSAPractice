import UIKit

// Q1.
// Given a linked list, write a function to traverse it and print each value in order.

class Node<T> {
    var next: Node?
    let val: T
    init(val: T) {
        self.val = val
    }
}

// Print format:

//```
//-> 4 -> 9 -> 2 -> 3 -> nil
//```

func printList(head: Node<Int>?) {
    guard head != nil else {
        print("nil")
        return
    }
    var current = head
    var result = "-> "
    
    while current != nil {
        result += "\(current?.val ?? 0) -> "
        current = current?.next
    }
    result += "nil"
    print(result)
}
var four = Node(val: 4)
var nine = Node(val: 9)
var two = Node(val: 2)
var three = Node(val: 3)
four.next = nine
nine.next = two
two.next = three
printList(head: four)
 
