import UIKit

struct Stack<T: Equatable>: Equatable {
    private var elements = [T]()
    
    static func ==(lhs: Stack, rhs: Stack) -> Bool {
        return lhs.elements == rhs.elements
    }
    
    public var peek: T? {
        return elements.last
    }
    
    public var count: Int {
        return elements.count
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    // add to the top of the stack (end)
    public mutating func push(_ value: T) {
        elements.append(value) // O(1)
    }
    
    // remove from the top of the stack
    public mutating func pop() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeLast() // O(1)
    }
}

var stack = Stack<Int>()
stack.push(5)
stack.push(9)
stack.push(17)
stack.push(30)

var otherStack = Stack<Int>()
otherStack.push(15)
otherStack.push(120)
otherStack.push(2)

//Problem One:
//Find the largest integer in a Stack of Ints
func largest(stack: Stack<Int>) -> Int {
    var ourStack = stack
    var largestNum = 0
    
    while !ourStack.isEmpty {
        if let lastNum = ourStack.pop() {
            if largestNum < lastNum {
                largestNum = lastNum
            }
        }
    }
    
    return largestNum
}

assert(largest(stack: stack) == 30, "should be equal to 30")
assert(largest(stack: otherStack) == 120, "should be equal to 120")


//Problem Two:
//Find the sum of a Stack of Ints
 func sum(stack: Stack<Int>) -> Int {
    var stackCopy = stack
    var sum = 0
    
    while !stackCopy.isEmpty {
        if let lastNum = stackCopy.pop() {
            sum += lastNum
        }
    }
    
   return sum
 }

 assert(sum(stack: stack) == 61, "should be equal to 61")
 assert(sum(stack: otherStack) == 137, "should be equal to 137")

struct Queue<T: Comparable> {
    private var elements = [T]()
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    public var count: Int {
        return elements.count
    }
    public var peek: T? {
        return elements.first
    }
    public mutating func enqueue(_ item: T) {
        elements.append(item)
    }
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return elements.removeFirst()
    }
}

func reverse<T: Comparable>(stack: Stack<T>) -> Stack<T> {
    var stackCopy = stack
    var queue = Queue<T>()
    
    while !stackCopy.isEmpty {
        if let last = stackCopy.pop(){
            queue.enqueue(last)
        }
    }
    while !queue.isEmpty {
        if let first = queue.dequeue() {
            stackCopy.push(first)
        }
    }
    return stackCopy
    
}

 var originalStack = Stack<Int>()
 originalStack.push(4)
 originalStack.push(2)
 originalStack.push(9)
 originalStack.push(3)

 var reversedStack = Stack<Int>()
 reversedStack.push(3)
 reversedStack.push(9)
 reversedStack.push(2)
 reversedStack.push(4)

 assert(reverse(stack: originalStack) == reversedStack, "should be equal to reversedStack")
print(reverse(stack: originalStack))




