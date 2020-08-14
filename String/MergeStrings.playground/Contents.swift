import UIKit


//For s1 = "dce" and s2 = "cccbd", the output should be
//mergeStrings(s1, s2) = "dcecccbd"
//All symbols from s1 goes first, because all of them have only 1 occurrence in s1 and c has 3 occurrences in s2

//9/10 test cases solved
func mergeStrings(s1: String, s2: String) -> String {
    let string1 = Array(s1)
    let string2 = Array(s2)
    var index1 = 0
    var index2 = 0
    var result = String()
    var count1 = [Character: Int]()
    var count2 = [Character: Int]()
    
    for char in s1 {
        if let value = count1[char] {
            count1[char] = value + 1
        } else {
            count1[char] = 1
        }
    }
    for char in s2 {
        if let value = count2[char] {
            count2[char] = value + 1
        } else {
            count2[char] = 1
        }
    }
    
    while index1 < string1.count && index2 < string2.count {
        if let dict1 = count1[string1[index1]], let dict2 = count2[string2[index2]] {
            if dict1 > dict2 {
                result += String(string2[index2])
                index2 += 1
            } else if dict2 > dict1 {
                result += String(string1[index1])
                index1 += 1
            } else {
                if string1[index1] < string2[index2] {
                    result += String(string1[index1])
                    index1 += 1
                } else {
                    result += String(string2[index2])
                    index2 += 1
                }
            }
        }
        
    }
    if index2 < string2.count {
        result.append(contentsOf: string2[index2..<string2.count])
    } else if index1 < string1.count {
        result.append(contentsOf: string1[index1..<string1.count])
    }
    return result
}
mergeStrings(s1: "super", s2: "tower")//"stouperwer"
mergeStrings(s1: "dce", s2: "cccbd")//"dcecccbd"
mergeStrings(s1: "ougtaleegvrabhugzyx", s2: "wvieaqgaegbxg")
