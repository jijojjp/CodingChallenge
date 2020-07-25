// Remove Nth Node From End of List

//Given a linked list, remove the n-th node from the end of list and return its head.
//
//Example:
//
//Given linked list: 1->2->3->4->5, and n = 2.
//
//After removing the second node from the end, the linked list becomes 1->2->3->5.
//Note:
//
//Given n will always be valid.
//
//Follow up:
//
//Could you do this in one pass?
/**
 * Definition for singly-linked list.
 */
 
 
 public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard n > 0 else {
            return nil
        }
        // This has to be created to remove edge condition of node with single element and first element.
        let dummyNode: ListNode? = ListNode()
        dummyNode?.next = head
        var endNode: ListNode? = dummyNode
        
         // Advances first pointer so that the gap between first and second is n nodes apart
        for _ in 1...n {
            endNode = endNode?.next
        }
        
        // Traverse both pointer until the end
        var nodeToDelete : ListNode? = dummyNode
        while endNode?.next != nil {
            nodeToDelete = nodeToDelete?.next
            endNode = endNode?.next
        }
        
        nodeToDelete?.next = nodeToDelete?.next?.next
        return dummyNode?.next
    }
}
