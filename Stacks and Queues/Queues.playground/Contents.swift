import UIKit

//Queues: an abstract data type that is FIFO (first one in first one out)

//methods:
//enqueue: adds item to the back of the queue
//dequeue: removes item from the front of the queue

//properties:
//isEmpty, count, peek

struct Queue<T: Comparable> {
    //implementing a queue using an array
    private var elements = [T]()
    //properties:
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    public var count: Int {
        return elements.count
    }
    public var peek: T? {
        return elements.first
    }
    
    //methods:
    public mutating func enqueue(_ item: T) {
        elements.append(item)
    }
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return elements.removeFirst()
    }
    
}

var queue = Queue<String>()

queue.enqueue("Mel")
queue.enqueue("Kelby")
queue.enqueue("Oscar")

print("\(queue.peek ?? "") is at the front of the line")

queue.dequeue()
print(queue)

queue.enqueue("Eric")
print("there are \(queue.count) fellows in line")

//iterate through a queue structure

var queueCopy = queue

//while the queue has objects in it, remove them until its empty
while let value = queueCopy.dequeue() {
    print("fellow: \(value)")
}

print("there are \(queueCopy.count) fellows left in the queueCopy")



var queueNumbers = Queue<Int>()
queueNumbers.enqueue(1)
queueNumbers.enqueue(20)
queueNumbers.enqueue(3)
queueNumbers.enqueue(13)
queueNumbers.enqueue(-20)

//1. find the smallest value in a queue
func smallestElement(in q: Queue<Int>) -> Int {
    
    var qCopy = q
    guard var currentSmall = qCopy.peek else {
        return 0
    }
    
    while let num = qCopy.dequeue() {
        if currentSmall > num {
            currentSmall = num
        }
    }
    return currentSmall
}
print(smallestElement(in: queueNumbers))

//2. find the sum of ints in a queue
func sum(of q: Queue<Int>) -> Int {
    var qCopy = q
    var sum = Int()
    
    while let num = qCopy.dequeue() {
        sum += num
    }
    return sum
}
print(sum(of: queueNumbers))

//3. Find out if the queue is in order from smallest to largest
func isSorted(q: Queue<Int>) -> Bool {
    var qcopy = q
    var result = Bool()
    guard var before = qcopy.peek else {
        return true
    }
    
    while let num = qcopy.dequeue() {
        if before > num {
            result = false
            break
        } else {
            before = num
            result = true
        }
    }
    return result
}
print(isSorted(q: queueNumbers))

//4. Return the queue in reverse
struct Stack<T> {
    private var elements = [T]()
    private var peek: T? {
        return elements.last
    }
    private var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func push(item: T) {
        elements.append(item)
    }
    mutating func pop() -> T? {
        guard !isEmpty else {
            return nil
        }
        let last = elements.removeLast()
        return last
    }
}

func reverseQueue(q: Queue<Int>) -> Queue<Int> {
    var stack = Stack<Int>()
    var qCopy = q
    
    while let num = qCopy.dequeue() {
        stack.push(item: num)
    }
    while let num = stack.pop() {
        qCopy.enqueue(num)
    }
    return qCopy
}
print(reverseQueue(q: queueNumbers))

//5. determine if two queues are equal
var secondQueue = Queue<Int>()
secondQueue.enqueue(1)
secondQueue.enqueue(20)
secondQueue.enqueue(3)
secondQueue.enqueue(13)
secondQueue.enqueue(-20)

func checkingBothQueues(qOne: Queue<Int>, qTwo: Queue<Int>) -> Bool {
    var q1 = qOne
    var q2 = qTwo
    var result = Bool()
    
    //if q1.count == q2.count {
         while let num = q1.dequeue(), let num2 = q2.dequeue() {
            if q1.count == q2.count {
                if num == num2 {
                    print("num \(num) num2 \(num2)")
                    result = true
                } else {
                    print("num \(num) num2 \(num2)")
                    result = false
                }
            }
            
        }
    return result
}

print(checkingBothQueues(qOne: queueNumbers, qTwo: secondQueue))
