/*
Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Note that an empty string is also considered valid.

Example 1:

Input: "()"
Output: true
Example 2:

Input: "()[]{}"
Output: true
Example 3:

Input: "(]"
Output: false
Example 4:

Input: "([)]"
Output: false
Example 5:

Input: "{[]}"
Output: true

*/

class Solution {
    func isValid(_ s: String) -> Bool {
        var items: [String] = []
        for index in s.indices {
            if s[index] == "(" || s[index] == "[" || s[index] == "{" {
                items.insert(String(s[index]), at: 0)
            } else if s[index] == ")" || s[index] == "]" || s[index] == "}" {
                if items.isEmpty {
                    return false                  
                }
                let item = items.removeFirst()
                if (s[index] == ")" && item != "(" || 
                    s[index] == "]" && item != "["  ||
                    s[index] == "}" && item != "{") {
                    return false
                }
            }
        }
        return items.isEmpty
    }
}
