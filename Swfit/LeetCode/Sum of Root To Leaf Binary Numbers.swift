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
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        guard let r = root else { return 0 }
        var queue: [String] = []
        var answer: Int = 0
        
        dfs(r, &queue, &answer)
        return answer
    }
    
    func dfs(_ root: TreeNode?, _ queue: inout [String], _ answer: inout Int) {
        if root == nil {
            return
        }
        
        queue.append(String(root!.val))
        
        if root!.left == nil && root!.right == nil {
            var binaryString = ""
            for i in queue {
                binaryString += i
            }
            answer += Int(binaryString, radix: 2)!
            queue.removeLast()
            return
        }
    
        dfs(root!.left, &queue, &answer)
        dfs(root!.right, &queue, &answer)
        
        queue.removeLast()
    }
}
