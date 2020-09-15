import UIKit

//Vardriadic Syntax Data Type
//The friends data type can be treated like a collection
func networkingList(_ friends: String...) {
    guard !friends.isEmpty else {
        print("go network")
        return
    }
    for friend in friends {
        print("\(friend) is now a friend")
    }
}
networkingList("Greg") // can input one value
networkingList("Chelsi", "Luba") // or multiple values


