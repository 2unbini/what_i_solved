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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let headNode = head!
        let secondNode = headNode.next
        let thirdNode = secondNode?.next

        secondNode?.next = headNode
        headNode.next = swapPairs(thirdNode)

        return secondNode
    }
}

/*

1 -> 2 -> 3 -> 4 일 때,
1 <-> 2 <-> 3 <-> 4 가 아님.
2가 1을 가리키고, 1이 3을 가리켜야 하는데, 그전에 4가 3을 가리켜야 하므로 head인 친구가 다음음 가리키는건 재귀적으로 뒤에서부터 함수탈출하면서 가리켜야 함

*/
