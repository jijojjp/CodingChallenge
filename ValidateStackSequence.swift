/*
 Validate Stack Sequences
 
 Given two sequences pushed and popped with distinct values, return true if and only if this could have been the result of a sequence of push and pop operations on an initially empty stack.


 Input: pushed = [1,2,3,4,5], popped = [4,5,3,2,1]
 Output: true
 Explanation: We might do the following sequence:
 push(1), push(2), push(3), push(4), pop() -> 4,
 push(5), pop() -> 5, pop() -> 3, pop() -> 2, pop() -> 1
 
 Input: pushed = [1,2,3,4,5], popped = [4,3,5,1,2]
 Output: false
 Explanation: 1 cannot be popped before 2.
 */

class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        if pushed.count == 0 || popped.count == 0 {
            return pushed.count == popped.count
        }
        var pushed = pushed, popped = popped
        var pushVal = pushed.remove(at: 0)
        var mystack: [Int] = [pushVal]

        while !mystack.isEmpty {
            if pushVal == popped.first {
                popped.remove(at: 0)
                mystack.remove(at: mystack.count - 1)
                if mystack.last != nil {
                    pushVal = mystack.last!
                } else {
                    if !pushed.isEmpty {
                        pushVal = pushed.remove(at: 0)
                        mystack.append(pushVal)
                    } else {
                        break
                    }
                }
            } else {
                if !pushed.isEmpty {
                    pushVal = pushed.remove(at: 0)
                    mystack.append(pushVal)
                } else {
                    return false
                }
            }
        }
        return true
    }
}
