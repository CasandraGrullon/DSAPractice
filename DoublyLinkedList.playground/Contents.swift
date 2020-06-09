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
            //1.
            return
        }
        guard let next = firstNode?.next else {
            //2.
            firstNode = nil
            return
        }
        //3.
        next.previous = nil
        firstNode = next
        head = next
    }
    //delete tail
    func deleteTail(_ last: DLNode?) {
        var lastNode = last
        guard lastNode != nil else {
            return
        }
        guard let previous = lastNode?.previous else {
            lastNode = nil
            return
        }
        previous.next = nil
        lastNode = previous
        tail = previous
        
    }
    //insert value after some node
    func insertNodeAfter(_ node: DLNode?, value: Int){
        //ex: 10 -> 8 -> 3
        //insert(at: head.next, value: 4)
        //output: 10 -> 4 -> 8 -> 3
        let newNode = DLNode(value)
        //does the node exist
        guard let currentNode = node else {
            return
        }
        //does the node have a next value?
        guard let next = currentNode.next else {
            //if currentNode does not have a next, it means current node is the tail
            currentNode.next = newNode
            newNode.previous = currentNode
            tail = newNode
            return
        }
        //if there is a next node, assign accordingly
        //need to reassign head/tail if currentNode.next = head/tail
        currentNode.next = newNode
        newNode.previous = currentNode
        newNode.next = next
    }
    //insert value before some node
    func interNodeBefore(_ node: DLNode?, value: Int) {
        let newNode = DLNode(value)
        guard let currentNode = node else {
            return
        }
        guard let previous = currentNode.previous else {
            currentNode.previous = newNode
            newNode.next = currentNode
            head = newNode
            return
        }
        currentNode.previous = newNode
        newNode.next = currentNode
        newNode.previous = previous
        previous.next = newNode
    }
    //TODO5: delete Node at given index
    func delete(atIndex: Int) {
        var current = head
        var array = [Int]()
        while let node = current {
            array.append(node.value)
            current = node.next
        }
        for index in 0...array.count - 1 {
            if index == array.count - 1 {
                deleteTail(tail)
            } else if index == 0 {
                deleteHead(head)
            } else {
                current = head?.next
                if current?.value == array[index] {
                    guard let next = current?.next else {
                        return
                    }
                    head?.next = next
                    next.previous = head
                } else {
                    current = current?.next
                }
            }
        }
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
example("delete head") {
    list.printForward()
    list.deleteHead(list.head)
    list.printForward()
}
example("delete tail") {
    list.printForward()
    list.deleteTail(list.tail)
    list.printForward()
}
example("insert after node") {
    list.printForward()
    list.insertNodeAfter(list.tail, value: 4)
    list.printForward()
    list.tail
}
example("insert before node") {
    list.printForward()
    list.interNodeBefore(list.head?.next, value: 15)
    list.printForward()
}
example("delete from index") {
    list.printForward()
    list.delete(atIndex: 1)
    list.printForward()
}
