import UIKit


//=======================================
// inout functions:
// & == inout
// changes the values of a variable outside of the scope/ outside of the function.
func swapTwoInts(int1: inout Int, int2: inout Int) {
    //1. save value of int1 to temp to avoid override
    let temp = int1
    //2. override int1 to have int2's value
    int1 = int2
    //3. give int2's int1's former value
    int2 = temp
}

var num1 = 4
var num2 = 13

print("Before swap: int1: \(num1) int2: \(num2)")

swapTwoInts(int1: &num1, int2: &num2)
print("After swap: int1: \(num1) int2: \(num2)")

//============================================================
// Generic Function:
// allow us to create a function that can use any data type
// syntax for Generic is < >
// Generic enforces type safety -- Any is NOT type safe (can have any data type)

func swapTwoValues<T>(value1: inout T, value2: inout T) {
    let temp = value1
    value1 = value2
    value2 = temp
}

var name1 = "Alex"
var name2 = "Paul"

print("Before swap: name1: \(name1) name2: \(name2)")
swapTwoValues(value1: &name1, value2: &name2)
print("After swap: name1: \(name1) name2: \(name2)")

//=========================================================
// creating a Generic Stacks using an array

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
