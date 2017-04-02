
/* You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8

*/

/**
 * Definition for singly-linked list.
*/  
  
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }
 

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let len1 = l1, let len2 = l2 else {
            return nil
        }
        var total = len1.val + len2.val
        var carry =  0
        if total / 10 != 0  {
            total = total%10
            carry = 1
        }
        var nodeResult = ListNode(total)
        var node1 = len1
        var node2 = len2
        let firstNode = nodeResult
        while node1.next != nil || node2.next != nil {
            if let nodeV = node1.next, let nodeR = node2.next {
                total = nodeV.val + nodeR.val + carry
                if total / 10 != 0 {
                    total = total%10
                    carry = 1
                } else {
                    carry = 0
                }
                nodeResult.next = ListNode(total)
                node1 = nodeV
                node2 = nodeR
            } else if let nodeV = node1.next {
                total = nodeV.val + carry
                if total / 10 != 0 {
                    total = total%10
                    carry = 1
                } else {
                    carry = 0
                }
                nodeResult.next = ListNode(total)
                node1 = nodeV
            } else if let nodeR = node2.next {
                total = nodeR.val + carry
                if total / 10 != 0 {
                    total = total%10
                    carry = 1
                } else {
                    carry = 0
                }
                nodeResult.next = ListNode(total)
                node2 = nodeR
            } else if carry == 1 {
                nodeResult.next = ListNode(carry)
                carry = 0
            }
            nodeResult = nodeResult.next ?? ListNode(0)
        }
        if carry == 1 {
            nodeResult.next = ListNode(carry)
        }
        return firstNode
    }
}
