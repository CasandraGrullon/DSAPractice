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
// my code is in Swift, I currently only know this language
func decodeNumbers(_ n: Int, _ map: [String: Int]) {
  var count = Int()
    var subNumber = [String]()
    
    for (_, value) in map.sorted(by: {$0.value < $1.value}) {
      if String(n).contains(String(value)) {
        subNumber.append(String(value))
      }
    }
    count += subNumber.count
    print(count)
}
decodeNumbers(12, ["A": 1, "B":2, "C": 3, "D": 22, "L": 12])
