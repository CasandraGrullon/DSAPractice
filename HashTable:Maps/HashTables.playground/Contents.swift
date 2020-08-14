import UIKit

//recreating a dictionary
var buckets = Array(repeating: 0, count: 2)

// hashValue is a built-in hash function that returns a hash value for a key
// index is where in the buckets array are we are storing the string "Alex"
// to avoid returning a negative index --> take the absolute value of the operation (make it positive) using abs()
let index1 = abs("Alex".hashValue % buckets.count)
let index2 = abs("Brendon".hashValue % buckets.count)
let index3 = abs("Ahad".hashValue % buckets.count)

//"Collision" -> if the count is less than the number of items we are adding
//to avoid collisions, we can use "Chaining" -> a chain of key value pairs
//Chaining can be made with Linked Lists
//print("Alex goes in \(index1) index, Brendon goes in \(index2) index, Ahad goes in \(index3) index")

// implementing a Hash Table
struct HashTable <Key: Hashable, Value> {
    //(key, value) -> a tuple. we cannot name tuples so we make a typealias for it
    private typealias Element = (key: Key, value: Value)
    
    //collision resolution being implemented using chaining
    private typealias Bucket = [Element] //these are the chains
    
    private var buckets: [Bucket]//an array of dictionaries [[key:value]]
    
    private (set) var count = 0 //setter is private(updating count is private), getter is public(seeing the count is public)
    
    init(capacity: Int) {
        assert(capacity > 0) //else it crashes
        buckets = Array<Bucket>(repeating: [], count: capacity)
        //ex: buckets = [[],[key: "Tiffany, value: 29"],[]]
    }
    //HASH TABLE Methods
    
    //1. method to return index where key is stored
    func index(forKey key: Key) -> Int {
        return abs(key.hashValue % buckets.count)
    }
    
    //2. method to search for a value given a key
    func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }
    
    //3. method to update a value for a given key
    mutating func update(value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        //i = index
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                //update oldValue with a new value
                buckets[index][i].value = value //buckets is an array of arrays
                return oldValue
            }
        }
        //if the key doesnt have a value...
        //append these new values to the array
        buckets[index].append((key: key, value: value))
        count += 1
        return nil //to signify that there wasn't an exisiting value
    }
    
    //4. method to remove an element at a given key
    mutating func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        return nil
    }
    //allows us to access a key and value like: hashTable["Name"] = 22
    subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        } set {
            if let value = newValue {
                update(value: value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
}

//test hash table
var hashTable = HashTable<String, Int>(capacity: 4)
hashTable.update(value: 21, forKey: "Tiffany")
hashTable.update(value: 25, forKey: "Eric")
hashTable.update(value: 28, forKey: "Eric")
hashTable.removeValue(forKey: "Eric")
hashTable["Tiffany"] = 29 // subscript function allows us to update the value like the .update func
hashTable.count
print(hashTable)

//optional binding
if let name = hashTable["Alex"] {
    print("\(name) exists in table")
} else {
    print("does not exist")
}

//nil coalescing
let age = hashTable["Cameron"] ?? 120 //does not exist, so 120 will be printed
print(age)
