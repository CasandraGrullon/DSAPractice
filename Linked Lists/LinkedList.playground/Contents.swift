import UIKit

//1. implementing Node Structure
class Node<T: Equatable>: Equatable {
    var value : T
    var next: Node? // Singly linked list: Can only see next value
    //var previous: Node? // Doubly linked list: Can see next value and previous value --> pointers in both directions.
    
    //required method for Equatable ---> lhs(left hand side) == tail, rhs(right hand side) == head
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value && lhs.next == rhs.next
    }
    
    init(_ value: T) {
        self.value = value
    }
}

//2. Linked Lists do not have a way to print it's contents --> need to implement CustomStringConvertable
extension Node: CustomStringConvertible {
    //description is a computed property that will return the string we assign it
    var description: String {
        //if there is a next value, store it in the "next" constant value
        guard let next = next else {
            //if it is nil, print: 12 -> nil
            return "\(value) -> nil"
        }
        // if there are more connected nodes
        return "\(value) -> \(next)"
    }
}

//3. instantiating Nodes
let car12 = Node<Int>(12)
let car99 = Node<Int>(99)

//4. link/connect nodes (Linked List)
car12.next = car99

// without CustomStringConvertable - the print statement will look like this: __lldb_expr_1.Node<Swift.Int>
print(car12)

// implementation of a Linked List
class LinkedList<T: Equatable> {
    var head: Node<T>?
    var tail: Node<T>?
    var removedNode: Node<T>?
    
    //first computed property
    public var first: Node<T>? {
        return head
    }
    //last computed property
    public var last: Node<T>? {
        return tail
    }
    
    //isEmpty computed property
    public var isEmpty: Bool {
        return head == nil
    }
    
    //append method
    public func append(_ value: T) {
        // create a node
        let newNode = Node(value)
        
        // scenerio 1: appending to an empty list
        guard let lastNode = tail else {
            //s1: if list is empty:
            head = newNode
            tail = head
            return
        }
        // scenerio 2: appending to a list with one or more objects
        //s2: 1. assign next value
        lastNode.next = newNode
        //s2: 2. assign newNode to tail
        tail = newNode
    }
    
    //remove last method
    public func removeLast() -> Node<T>? {
        //scenerio 1: empty list
        if isEmpty {
            return nil
        }
        //scenerio 2: removing the one and only object in list
        if head == tail {
            let removedNode = head
            head = nil
            tail = nil
            return removedNode
        }
        //scenerio 3: removing an object with more than one object in list
        //s3: 1. walk the linked list, starting from the head
        //IMPORTANT NOTE: cannot use a for loop on a custom data structure
        var currentNode = head
        while currentNode?.next != tail { // stop at node before tail
            // keep traversing/walking
            currentNode = currentNode?.next
        }
        //s3: 2.
        removedNode = tail
        //s3: 3.
        tail = currentNode
        //s3: 4.
        currentNode?.next = nil
        
        return removedNode
    }
//    func reverseList(_ head: Node<T>?) -> Node<T>? {
//
//    }
    
}
extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "list is empty"
        }
        return "\(head)"
    }
}

let fellows = LinkedList<String>()
fellows.append("Oscar")
print(fellows)
fellows.removeLast()
print(fellows)
fellows.append("Luba")
print(fellows)
fellows.append("Tanya")
fellows.append("David")
fellows.removeLast()
print(fellows)

