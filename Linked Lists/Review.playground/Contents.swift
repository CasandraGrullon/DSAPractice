import UIKit

//https://github.com/alexpaul/LinkedList
class Node {
    var value: Int
    var next: Node?
    init(_ value: Int) {
        self.value = value
    }
}
struct LinkedList {
    private var head: Node?
    private var tail: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
}
//Append method
extension LinkedList {
    mutating func append(_ value: Int) {
        // 1
        // create a new node with the value
        let newNode = Node(value)
        // 2
        // if the list is empty create a new node and add to the head and tail
        if isEmpty {
            head = newNode
            tail = newNode
            return
        }
        // if there are more values in the list, we need to have the (last last node point to the new node)
        guard let lastNode = tail else {
            return
        }
        lastNode.next = newNode
        tail = newNode
    }
}
//Print values
extension LinkedList {
    func printList() {
        var head = self.head
        while let currentNode = head {
            print(currentNode.value)
            head = currentNode.next
        }
    }
}
//CHALLENGE 1: Remove last value of linked list
//reverse list
func reverseList(_ node: Node?) -> Node? {
    var node = node
    var previousNode: Node?
    var nextNode: Node?
    
    // 1 -> 2 -> 3 -> 4
    while let currentNode = node {
        nextNode = currentNode.next
        currentNode.next = previousNode
        previousNode = currentNode
        node = nextNode
    }
    
    return previousNode
}
extension LinkedList {
    func removeLast() -> Node? {
        guard let head = self.head else {
            return nil
        }
        //1. reverse the list
        //2. remove the first value/ replace with nil
        //3. revert to initial order
        //4. return
        var current = reverseList(head)
        current = current?.next
        return reverseList(current)
    }
}
var list = LinkedList()
list.append(1)
list.append(2)
list.append(3)
list.append(4)
list.removeLast()
list.printList()
