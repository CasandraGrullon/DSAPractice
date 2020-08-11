import UIKit

//Stack: First one in, last one out

struct Stack<T> {
    private var elements = [T]()
    
    // see the top of the stack
    public var peek: T? {
        return elements.last
    }
    
    // adding to stack
    mutating func push(item: T) {
        elements.append(item)
    }
    
    // remove from stack
    mutating func pop() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeLast()
    }
    
}

var cohorts = Stack<Double>()
cohorts.push(item: 1.0)
cohorts.push(item: 2.0)
cohorts.push(item: 3.0)
cohorts.push(item: 4.0)
cohorts.push(item: 5.0)
cohorts.push(item: 6.3)
print(cohorts.peek ?? 1.0)

cohorts.pop()
cohorts.pop()
print(cohorts.peek ?? 1.0)

struct Fellow {
    let name: String
    let language: String
}

let ameni = Fellow(name: "Ameni", language: "Swift")
let tom = Fellow(name: "Tom", language: "Kotlin")

var fellows = Stack<Fellow>()
fellows.push(item: tom)
print(fellows)



class MinStack {
    
    var array = [Int]()
    var array2 = [Int]()
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        if array2.isEmpty {
         array2.append(x)
        }else if let min = array2.last {
            if x <= min {
                array2.append(x)
            }
        }
        array.append(x)
    }
    
    func pop() {
        
        if let min = array2.last {
            if let stackLast = array.last {
                if stackLast == min {
                    array.removeLast()
                    array2.removeLast()
                } else {
                    array.removeLast()
                }
            }
        }
        
    }
    
    
    func top() -> Int {
        return array.last ?? 0
    }
    
    func getMin() -> Int {
        return array2.last ?? 0
        
    }
}
let obj = MinStack()
obj.push(2)
obj.push(0)
obj.push(3)
obj.push(0)
obj.getMin()
//obj.top()
obj.pop()
obj.getMin()
obj.array2

var firstArray = [1,2,3,4]
var largest = Int()
var currentIndex = 0

for num in firstArray {
    if num > largest {
        largest = num
    } else {
        currentIndex += 1
    }
}

print(largest)
