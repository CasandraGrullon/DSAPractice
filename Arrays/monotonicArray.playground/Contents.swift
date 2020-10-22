import UIKit

func isMonotonic(_ A: [Int]) -> Bool {
    guard !A.isEmpty else {
        return true
    }
    let ascending = A.sorted(by: {$0 < $1})
    let descending = A.sorted(by: {$0 > $1})
    
    if A == ascending || A == descending {
        return true
    } else {
        return false
    }
}
isMonotonic([1,2,2,3])
isMonotonic([6,5,4,4])
isMonotonic([1,3,2])

func longestCommonPrefix(_ strs: [String]) -> String {
     if strs.count == 0 { return "" }
    
     var minStr = (strs.min{$0.count < $1.count})!
     
     for str in strs{
         while !str.hasPrefix(minStr){
              minStr.removeLast()
         }
     }
     
     return minStr
}
longestCommonPrefix(["flower", "flow", "flight"])
longestCommonPrefix(["ab", "a"])
longestCommonPrefix(["flower","flowers","flowe"])
