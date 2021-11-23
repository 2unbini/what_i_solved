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

// 원칙 -- keyNode.right가 존재한다면, parentNode에 keyNode.right를 붙이기
// 원칙 -- keyNode.left가 존재한다면, keyNode.right 아래로 붙이기
// 예외 -- keyNode.right == nil && keyNode.left == nil => make parentNode.?? = nil
// 예외 -- keyNode == root일 때 : keyNode.right 존재하면 root의 오른쪽 가장 작은 node에 왼쪽 노드들 붙이고 return keyNode.right
//                               keyNode.left 존재하면 return keyNode.left
//                               둘 다 없으면 return nil

class Solution {

    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        
        var parentNode = root
        var isKeyFromRight = false 
        var keyNode = findKeyNode(&parentNode, root, key, &isKeyFromRight)
        
        if keyNode == nil {
            return root
        }
        else if keyNode!.val == root!.val {
            if keyNode!.right != nil {
                let newNode = keyNode!.right
                findSmallestNode(newNode!).left = keyNode!.left
                return newNode
            } else if keyNode!.right == nil && keyNode!.left != nil {
                return keyNode!.left
            } else {
                return nil
            }
        }
        else {
            if keyNode!.right != nil {
                let newNode: TreeNode = keyNode!.right!
                
                if isKeyFromRight == true {
                    parentNode!.right = newNode
                    findSmallestNode(newNode).left = keyNode!.left
                }
                else {
                    parentNode!.left = newNode
                    findSmallestNode(newNode).left = keyNode!.left
                }
            }
            else if keyNode!.right == nil && keyNode!.left != nil {
                let newNode: TreeNode = keyNode!.left!
                
                if isKeyFromRight == true {
                    parentNode!.right = newNode
                }
                else {
                    parentNode!.left = newNode
                }
            }
            else {
                if isKeyFromRight == true {
                    parentNode!.right = nil
                }
                else {
                    parentNode!.left = nil
                }
            }
        }
        
        return root
    }
    
    func findSmallestNode(_ currNode: TreeNode) -> TreeNode {
        // Find the Smallest Node from the tree
        
        if currNode.left == nil {
            return currNode
        }
        
        return findSmallestNode(currNode.left!)
    }
    
    func findKeyNode(_ parentNode: inout TreeNode?, _ currNode: TreeNode?, _ key: Int, _ isKeyFromRight: inout Bool) -> TreeNode? {
        // Find KeyNode
        
        if currNode == nil {
            return nil
        }
        else {
            if (currNode!.val == key) {
                return currNode
            }
            else if (currNode!.left != nil && currNode!.val > key) {
                parentNode = currNode
                isKeyFromRight = false
                return findKeyNode(&parentNode, currNode!.left, key, &isKeyFromRight)
            }
            else if (currNode!.right != nil && currNode!.val < key) {
                parentNode = currNode
                isKeyFromRight = true
                return findKeyNode(&parentNode, currNode!.right, key, &isKeyFromRight)
            }
            else {
                return nil
            }
        }
    }
}
