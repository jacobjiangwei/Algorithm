import UIKit
public class TreeNode {
          public var val: Int
          public var left: TreeNode?
          public var right: TreeNode?
          public init(_ val: Int) {
                  self.val = val
                      self.left = nil
                      self.right = nil
              }
      }



func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    guard t1 != nil else {
        return t2
    }
    guard t2 != nil else {
        return t1
    }
    let newTree = TreeNode(t1!.val + t2!.val)
    newTree.left = mergeTrees(t1!.left, t2!.left)
    newTree.right = mergeTrees(t1?.right, t2?.right)
    return newTree    
}
