import UIKit

// Doubly Linked Lists
// nil <-> 10 <-> 5 <-> 6 <-> nil
// two pointers: previous and next
// takes up more memory
// faster access


// helper method to help while testing different methods below
func example(_ str: String, action: () -> ()) { // "testing append"
    print(str)
    action()
    print()
}
class DLNode {
    var next: DLNode?
    weak var previous: DLNode? //to avoid strong retain cycles
    var value: Int
    init(_ value: Int) {
        self.value = value
    }
}
// implement (Doubly Linked List) class
class DoublyLinkedList {
    private (set) var head: DLNode?
    private (set) var tail: DLNode?
    
    func append(_ value: Int) {
        //1. create a node
        let newNode = DLNode(value)
        //2. check to see if tail exists
        guard let lastNode = tail else {
            //Case 1: the list was found empty
            //now the new node is the only node so both the head and tail will point to it
            head = newNode
            tail = newNode
            return
        }
        //Case 2: There is at least one node in the list
        //a. assign the tail's next value to the new node
        lastNode.next = newNode
        //b. assign the previous value of the new node to the lastNode
        newNode.previous = lastNode
        //c. reassign the tail to the new node since it is now the last value in the list
        tail = newNode
    }
    //prepend - add a node to the front of the list
    func prepend(_ value: Int) {
        //1. create node
        let newNode = DLNode(value)
        //2. check to see if head exists
        guard let firstNode = head else {
            head = newNode
            tail = newNode
            return
        }
        //3. if the list has values:
        //a. assign the new node to head previous
        firstNode.previous = newNode
        //b. assign the new node's next value to old head
        newNode.next = firstNode
        //c. reassign head to new node
        head = newNode
    }
    //TODO2: delete head
    func deleteHead(_ first: DLNode?) {
        //1. check if the list is empty
        //2. check if the list only has 1 value (head)
        //3. check if list has more than 1 value
        var firstNode = first
        guard firstNode != nil else {
            return
        }
        guard let next = firstNode?.next else {
            firstNode = nil
            return
        }
        
        next.previous = nil
        firstNode = next
        head = next
    }
    //TODO3: delete tail
    func deleteTail(tail: DLNode) {
        
    }
    //TODO4: insert value after some node
    func insertNode(_ node: DLNode, value: Int){
        //ex: 10 -> 8 -> 3
        //insert(at: head.next, value: 4)
        //output: 10 -> 4 -> 8 -> 3
    }
    //TODO5: delete Node at given index
    func delete(atIndex: Int) {
        
    }
    
    func printForward() { //should print list only going forward
        var currentNode = head
        while let node = currentNode {
            print(node.value, terminator: " -> ")
            currentNode = node.next
        }
        print("nil")
    }
    func printReverse() {
        var currentNode = tail
        while let node = currentNode {
            print(node.value, terminator: " <- ")
            currentNode = node.previous
        }
        print("nil")
    }
}

let list = DoublyLinkedList()
example("testing append") {
    list.append(10)
    list.append(7)
    list.append(5)
    list.printForward()
}
example("print reverse") {
    list.printReverse()
}
example("prepend") {
    list.prepend(3)
    list.printForward()
}
example("remove head") {
    list.deleteHead(list.head)
    list.printForward()
}