import UIKit

//https://leetcode.com/problems/camelcase-matching/
//Input: queries = ["FooBar","FooBarTest","FootBall","FrameBuffer","ForceFeedBack"], pattern = "FoBa"
//Output: [true,false,true,false,false]
func camelMatch(_ queries: [String], _ pattern: String) -> [Bool] {
    return queries.map { match($0, pattern, Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ")) }
}
func match(_ query: String, _ pattern: String, _ set: Set<Character>) -> Bool {
    var patternChars = Array(pattern)
    let queryChars = Array(query)
    
    for char in queryChars {
        if set.contains(char) {
            if patternChars.count == 0 || char != patternChars.first! {
                return false
            } else {
                patternChars.removeFirst()
            }
        } else if patternChars.first == char {
            patternChars.removeFirst()
        }
    }
    
    return patternChars.count == 0
}
var queries = ["FooBar","FooBarTest","FootBall","FrameBuffer","ForceFeedBack"]
camelMatch(queries, "FoBa")
