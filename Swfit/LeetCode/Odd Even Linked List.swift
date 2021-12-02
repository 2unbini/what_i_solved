// Linked List
// optional -> ? 사용하기
// 링크드리스트는 가리키느 개념! -> head를 사용해도 무방함

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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var evenHead = head!.next
        var oddCurNode = head
        var evenCurNode = evenHead
        
        while evenCurNode?.next != nil {
            oddCurNode?.next = oddCurNode?.next?.next
            oddCurNode = oddCurNode?.next
            evenCurNode?.next = evenCurNode?.next?.next
            evenCurNode = evenCurNode?.next
        }
        
        oddCurNode?.next = evenHead
        return head
    }
}
