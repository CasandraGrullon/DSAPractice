import UIKit

//1. make Sensor class
class Sensor {
    var entries = [SensorEntry]()
    
    /**
    this method is meant to be called serially by the sensor class
    the timestamp will increase as it is called
     */
    func addEntry(value: Double, timestamp: Date) {
        let newEntry = SensorEntry(value: value, timestamp: timestamp)
        entries.append(newEntry)
    }
    // remove entries that are older than one hour
    func removeOldEntries() {
        //1. find the date for one hour ago
        //2. find which elements in the array are older
        //3. remove those elements
        let mostRecent = Date.init(timeIntervalSinceNow: -3600)
        if let firstIndex = entries.firstIndex(where: { (entry) -> Bool in
            entry.timestamp > mostRecent
        }) {
            entries.removeFirst(firstIndex)
        } else {
            entries.removeAll()
        }
    }
    //2. write method to return 5 highest values in past hour
    func lastHighestValues(entries: [SensorEntry]) -> [Double] {
        var correctEntries = [SensorEntry]()
        
        for entry in entries {
            
        }
        var highestValues = [Double]()
        correctEntries = correctEntries.sorted(by: {$0.value > $1.value})
        
        return highestValues
    }
    
}
class SensorEntry {
    let value: Double
    let timestamp: Date
    
    init(value: Double, timestamp: Date) {
        self.value = value
        self.timestamp = timestamp
    }
}


