import UIKit

//Implement a Stack using Queues
class MyQueue {
    var elements = [Int]()
    
    init() {}
    
    func add(_ value: Int) {
        elements.append(value)
    }
    func remove() -> Int? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
    func peek() -> Int? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.first
    }
    func qisEmpty() -> Bool {
        return elements.isEmpty
    }
    func count() -> Int {
        return elements.count
    }
}

class MyStack {
    
    var leftQueue: MyQueue
    var rightQueue: MyQueue
    var topElement = 0
    
    /** Initialize your data structure here. */
    init() {
        leftQueue = MyQueue()
        rightQueue = MyQueue()
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        // o(1)
        leftQueue.add(x)
        topElement = x
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        
        while leftQueue.count() > 1 {
            if let dequeue = leftQueue.remove() {
                rightQueue.add(dequeue)
                topElement = dequeue
            }
        }
        
        let x = leftQueue.remove() ?? 0
        
        while let dequeue = rightQueue.remove() {
            leftQueue.add(dequeue)
        }
        return x
    }
    
    /** Get the top element. */
    func top() -> Int {
        return topElement
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        leftQueue.qisEmpty()
    }
}

//Implement Queue using Stacks

class MyStack2 {
    var elements = [Int]()
    init(){}
    
    func add(_ x: Int) {
        elements.append(x)
    }
    func remove() -> Int? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeLast()
    }
    func returnLast() -> Int? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.last
    }
    func stackIsEmpty() -> Bool {
        return elements.isEmpty
    }
    func count() -> Int {
        return elements.count
    }
}

class MyQueue2 {
    var stack1 = MyStack2()
    var stack2 = MyStack2()
    var peekElement = Int()
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        stack1.add(x)
        if stack1.count() < 2 {
            peekElement = x
        }
    }
    
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        while stack1.count() > 1 {
            if let value = stack1.remove() {
                stack2.add(value)
                peekElement = value
            }
        }
        let x = stack1.remove() ?? 0
        while let dequeue = stack2.remove() {
            stack1.add(dequeue)
            
        }
        return x
        
    }
    
    /** Get the front element. */
    func peek() -> Int {
        return peekElement
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stack1.stackIsEmpty()
    }
}
var newQueue = MyQueue2()
newQueue.push(1)
print("1. newQueue: \(newQueue.stack1.elements), peek \(newQueue.peekElement)")
newQueue.push(2)
print("2. newQueue: \(newQueue.stack1.elements), peek \(newQueue.peekElement)")
newQueue.pop()
print("3. newQueue: \(newQueue.stack1.elements), peek \(newQueue.peekElement)")
newQueue.push(3)
print("4. newQueue: \(newQueue.stack1.elements), peek \(newQueue.peekElement)")
newQueue.push(4)
print("5. newQueue: \(newQueue.stack1.elements), peek \(newQueue.peekElement)")
newQueue.pop()
print("6. newQueue: \(newQueue.stack1.elements), peek \(newQueue.peekElement)")
newQueue.peekElement
print("7. newQueue: \(newQueue.stack1.elements), peek \(newQueue.peekElement)")

