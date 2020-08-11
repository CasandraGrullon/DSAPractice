import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


func deleteNode(_ node: ListNode?) {
    guard let next = node?.next else {
        return
    }
    node?.val = next.val
    node?.next = next.next
}

