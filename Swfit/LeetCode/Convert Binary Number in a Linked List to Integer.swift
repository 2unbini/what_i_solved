/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        if head?.next == nil {
            return 1 * head!.val
        }
        
        var curNode = head
        var count = -1
        var ret = 0
        
        while curNode != nil {
            count += 1
            curNode = curNode?.next
        }
        
        curNode = head
        while count >= 0 {
            let binary = curNode!.val
            ret += (Int(pow(2, Double(count))) * binary)
            count -= 1
            curNode = curNode?.next
        }
        
        return ret
    }
}
