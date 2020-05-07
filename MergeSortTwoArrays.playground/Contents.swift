import UIKit

//https://leetcode.com/problems/merge-sorted-array/

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < nums1.count && rightIndex < nums2.count {
        let leftElement = nums1[leftIndex]
        let rightElement = nums2[rightIndex]
        //if the element is 0, remove it
        
        if leftElement < rightElement {
            //since this value is in the nums1 array, leave it in the array as is
            leftIndex += 1
        } else if leftElement > rightElement {
            //instead of appending to a results array, the number needs to be inserted to the nums1 array
            nums1.insert(rightElement, at: leftIndex)
            rightIndex += 1
        } else if leftElement == rightElement {
            //append the right element
            nums1.insert(rightElement, at: leftIndex)
            leftIndex += 1
            rightIndex += 1
        }
    }
    //once left index hits the value of m, append all the remaining elements of nums2 array which is already sorted
    
    nums1.removeLast(n)
    
    nums1.append(contentsOf: nums2[rightIndex...] )
    
}

var numsa = [1,2,3,0,0,0]
var g = 3
var numsb = [2,5,6]
var c = 3
// expected [1,2,2,3,5,6]
merge(&numsa, g, numsb, c)
var nums3 = [-1,0,0,3,3,3,0,0,0]
var x = 6
var nums4 = [1,2,2]
var y = 3
merge(&nums3, x, nums4, y)
