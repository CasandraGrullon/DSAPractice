import UIKit

//Given an integer n and an array a of length n, your task is to apply the following mutation to a:
//
//Array a mutates into a new array b of length n.
//For each i from 0 to n - 1, b[i] = a[i - 1] + a[i] + a[i + 1].
//If some element in the sum a[i - 1] + a[i] + a[i + 1] does not exist, it should be set to 0. For example, b[0] should be equal to 0 + a[0] + a[1].

//For n = 5 and a = [4, 0, 1, -2, 3], the output should be mutateTheArray(n, a) = [4, 5, -1, 2, 1].
func mutateTheArray(n: Int, a: [Int]) -> [Int] {
    var b = [Int](repeatElement(0, count: n))
    
    guard n > 1 else {
        return a
    }
    
    var value = Int()
    var first = Int()
    var third = Int()
    
    for index in 0...a.count - 1 {
        third = index + 1
        first = index - 1
        if first < 0 {
            value = a[index] + a[third]
            print(value)
        } else if third > a.count - 1 {
            value = a[first] + a[index]
            print(value)
        } else {
            value = a[first] + a[index] + a[third]
        }
        b[index] = value
    }
    return b
}
print(mutateTheArray(n: 5, a: [4, 0, 1, -2, 3])) // [4, 5, -1, 2, 1]
