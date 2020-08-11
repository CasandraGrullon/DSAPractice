
import UIKit

public class LRUCache {
    //lru least recently used
    var values = [String]()
    var lru: String?
    var capacity: Int
    
  public init(capacity: Int) {
    self.capacity = capacity
  }
    
  @discardableResult
  public func get(index: Int) -> String? {
    var results = String()
    guard !values.isEmpty else {
        return nil
    }
    for ind in 0...values.count - 1 {
        if ind == index {
            results = values[ind]
            values.remove(at: ind)
            values.insert(results, at: 0) // moving value to front of array [3, 1, 2]
        }
    }
    lru = values.last
    return results
  }
  
  public func insert(value: String) {
    
    if capacity > values.count {
        values.insert(value, at: 0)
    } else {
        lru = values.removeLast()
        values.insert(value, at: 0)
    }
    
  }
  
  @discardableResult
  public func remove(value: String) -> Bool {
    
    guard !values.isEmpty else {
        return false
    }
    
    for (index, val) in values.enumerated() {
        if val == value {
            values.remove(at: index)
            return true
        }
    }
    return false
  }
}

var input1 = LRUCache(capacity: 3)
input1.insert(value: "a")
input1.insert(value: "b")
input1.insert(value: "c")
input1.get(index: 0)// c, b, a -> b, c, a
input1.get(index: 1)
print(input1.values)
