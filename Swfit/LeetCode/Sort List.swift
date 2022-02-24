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
    func sortList(_ head: ListNode?) -> ListNode? {
        var array = [Int]()
        
        if head == nil || head?.next == nil {
            return head
        }
        
        var curr: ListNode? = head!
        var newNode: ListNode? = head!
        var returnNode = newNode
        
        while curr != nil {
            array.append(curr!.val)
            curr = curr!.next
        }
        
        let sortedArray = array.sorted()
        for i in 0..<sortedArray.count {
            newNode!.val = sortedArray[i]
            newNode = newNode!.next
        }
        
        return returnNode
    }
}
