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
    var inorderDict: [Int: Int] = [:]
    
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        for i in 0..<inorder.count {
            inorderDict.updateValue(i, forKey: inorder[i])
        }
        
        return dfs(inorder, postorder, 0, inorder.count - 1, 0, postorder.count - 1)
    }
    
    func dfs(_ inorder: [Int], _ postorder: [Int], _ istart: Int, _ iend: Int, _ pstart: Int, _ pend: Int) -> TreeNode? {
        if (istart > iend || pstart > pend) {
            return nil
        }        
        if (istart == iend && pstart == pend) {
            return TreeNode(inorder[istart])
        }
        
        let rootValue = postorder[pend]
        let rootIndex = inorderDict[rootValue]!
        let leftCount = rootIndex - istart
        let rightCount = iend - rootIndex
        var ansTree = TreeNode(rootValue)
        
        ansTree.left = dfs(inorder, postorder, istart, rootIndex - 1, pstart, pstart + leftCount - 1)
        ansTree.right = dfs(inorder, postorder, rootIndex + 1, iend, pstart + leftCount, pstart + leftCount + rightCount - 1)
        
        return ansTree
    }
}
