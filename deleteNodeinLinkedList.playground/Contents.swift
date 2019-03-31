import UIKit


// Delete Node in a Linked List

// 给定一个单向链表的头指针和一个节点指针，该节点指针指向此链表中的某个节点(非尾节点)，要求删除该节点

/*
 Input: head = 4->5->1->9, node = 5
 Output: 4->1->9
 Explanation: You are given the second node with value 5, the linked list should become 4 -> 1 -> 9 after calling your function.
 */

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func deleteNode(_ head: ListNode?, _ node: ListNode) -> ListNode? {
        var result = head
        while result === node {
            result = result?.next
        }
        
        while result?.next != nil {
            if result === node {
                result?.next = result?.next?.next
            }
        }
        return result
    }
}


let node1 = ListNode(4)
node1.next = ListNode(5)
node1.next?.next = ListNode(1)
node1.next?.next?.next = ListNode(9)

let s = Solution()
let d = s.deleteNode(node1, ListNode(5))
print(d.debugDescription)
