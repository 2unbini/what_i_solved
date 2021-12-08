/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func findTilt(_ root: TreeNode?) -> Int {
        var sum = 0
        dfs(root, &sum)
        
        return sum
    }
    
    func dfs(_ cur: TreeNode?, _ sum: inout Int) -> Int {
        
        guard let curNode = cur else { return 0 }
        
        if curNode.left == nil && curNode.right == nil {
            return curNode.val
        }
        
        let left = dfs(curNode.left, &sum)
        let right = dfs(curNode.right, &sum)
        
        sum += abs(left - right)
        return curNode.val + left + right
    }
}
