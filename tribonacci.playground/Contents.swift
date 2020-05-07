import UIKit

 var fibValues = [Int: Int]()
    func tribonacci(_ n: Int) -> Int {
       
        if let fibResult = fibValues[n] {
        return fibResult
      }
        
        if n == 2 || n == 1 {
            return 1
        } else if n == 0 {
            return 0
        }
        
      let fibResult = tribonacci(n - 1) + tribonacci(n - 2) + tribonacci(n - 3)
      fibValues[n] = fibResult
      return fibResult
}

tribonacci(8)
