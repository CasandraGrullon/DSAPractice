import UIKit

//https://leetcode.com/problems/design-circular-queue/
//Design your implementation of the circular queue. The circular queue is a linear data structure in which the operations are performed based on FIFO (First In First Out) principle and the last position is connected back to the first position to make a circle. It is also called "Ring Buffer".

//One of the benefits of the circular queue is that we can make use of the spaces in front of the queue. In a normal queue, once the queue becomes full, we cannot insert the next element even if there is a space in front of the queue. But using the circular queue, we can use the space to store new values.

//14% faster solution
//my solution
class MyCircularQueue {
    
    var k: Int //maximum number of elements allowed in queue
    var elements = [Int]()
    
    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
        self.k = k
    }
    
    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else {
            return false
        }
        //1. if we try to append and the elements are full, return false
        //2. if we append and the elements are not full, return true
        if elements.count < k {
            elements.append(value)
            return true
        } else {
            return false
        }
        
    }
    
    /** Delete an element from the circular queue. Return true if the operation is successful. */
    func deQueue() -> Bool {
        guard !isEmpty() else {
            return false
        }
        if elements.count <= k {
            elements.removeFirst()
            return true
        } else {
            return false
        }
    }
    
    /** Get the front item from the queue. */
    func Front() -> Int {
        guard !isEmpty() else {
            return -1
        }
        guard let first = elements.first else {
            return -1
        }
        return first
    }
    
    /** Get the last item from the queue. */
    func Rear() -> Int {
        guard !isEmpty() else {
            return -1
        }
        guard let last = elements.last else {
            return -1
        }
        return last
    }
    
    /** Checks whether the circular queue is empty or not. */
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
    /** Checks whether the circular queue is full or not. */
    func isFull() -> Bool {
        return elements.count == k
    }
}

