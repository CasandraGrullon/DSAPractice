import UIKit
//
//For a = [1, 2, 3], b = [1, 2, 3], and k = 31, the output should be
//countTinyPairs(a, b, k) = 2.
//
//We're considering the following pairs during iteration:
//
//(1, 3). Their concatenation equals 13, which is less than 31, so the pair is tiny;
//(2, 2). Their concatenation equals 22, which is less than 31, so the pair is tiny;
//(3, 1). Their concatenation equals 31, which is not less than 31, so the pair is not tiny.

//func countTinyPairs(a: [Int], b: [Int], k: Int) -> Int {
//    var reversedB = [Int]()
//    var bCopy = b
//    while !bCopy.isEmpty {
//        if let last = bCopy.popLast() {
//            reversedB.append(last)
//        }
//    }
//
//    var tinyPairCount = 0
//    var ab = Int()
//    var current = 0
//
//    while current < a.count {
//        let abString = "\(a[current])\(reversedB[current])"
//        if let num = Int(abString) {
//            ab = num
//            if ab < k {
//                tinyPairCount += 1
//            }
//        }
//        current += 1
//    }
//    return tinyPairCount
//}
//
//countTinyPairs(a: [1,2,3], b: [1,2,3], k: 31)
//
////Given an array of positive integers a, your task is to calculate the sum of every possible a[i] ∘ a[j], where a[i] ∘ a[j] is the concatenation of the string representations of a[i] and a[j] respectively.
////
////Example
////
////For a = [10, 2], the output should be concatenationsSum(a) = 1344.
////
////a[0] ∘ a[0] = 10 ∘ 10 = 1010,
////a[0] ∘ a[1] = 10 ∘ 2 = 102,
////a[1] ∘ a[0] = 2 ∘ 10 = 210,
////a[1] ∘ a[1] = 2 ∘ 2 = 22.
//
//func concatenationsSum(a: [Int]) -> Int64 {
//    guard a.count > 0 else {
//        return 0
//    }
//    var aCopy = a
//    var reversed = [Int]()
//    while !aCopy.isEmpty {
//        if let last = aCopy.popLast() {
//            reversed.append(last)
//        }
//    }
//    var newValue = 0
//
//    for num in a {
//        for n in reversed {
//            let valueString = "\(num)\(n)"
//            if let num = Int(valueString) {
//                newValue += num
//            }
//        }
//    }
//    return Int64(newValue)
//}
//
//concatenationsSum(a: [10, 2]) // 1344
//
//func mergeStrings(s1: String, s2: String) -> String {
//    var array = [String]()
//    var string1 = makeArray(s: s1)
//    var string2 = makeArray(s: s2)
//
//    //1. check letters in arrays
//    //2. append to array if the letter is smaller
//    while !string1.isEmpty {
//        if let char1 = string1.first, let char2 = string2.first {
//            if char1 < char2 {
//                array.append(char1)
//                print(array)
//                string1.removeFirst()
//            } else {
//                array.append(char2)
//                print(array)
//                string2.removeFirst()
//            }
//        }
//    }
//    if !string2.isEmpty {
//        array.append(contentsOf: string2)
//    }
//    return array.joined()
//}
//func makeArray(s: String) -> [String] {
//    var result = [String]()
//
//    for char in s {
//        result.append(String(char))
//    }
//    return result
//}
//print(mergeStrings(s1: "dce", s2: "cccbd")) //dcecccbd


func almostSubstring(t: String, s: String) -> Int {
    guard t.count > s.count else {
        return 0
    }
    var tArray = [String]()
    var sArray = [String]()
    for char in t {
        tArray.append(String(char))
    }
    for char in s {
        sArray.append(String(char))
    }
    sArray = sArray.sorted()
    var count = 0
    
    
    while !tArray.isEmpty && tArray.count >= 3 {
        let subArray = makeSubArray(array: tArray, low: 0, high: 2)
        
        if subArray.joined() == sArray.joined() {
            count += 1
        }
        tArray.removeSubrange(0...2)
    }
    
    return count
}
func makeSubArray(array: [String], low: Int, high: Int) -> [String] {
    return Array(array[low...high]).sorted()
}

//almostSubstring(t: "azcabcab", s: "acb")
almostSubstring(t: "aabbcc", s: "abc")//2
