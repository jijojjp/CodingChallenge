
//
//Given a valid (IPv4) IP address, return a defanged version of that IP address.
//
//A defanged IP address replaces every period "." with "[.]".
//
//
//
//Example 1:
//
//Input: address = "1.1.1.1"
//Output: "1[.]1[.]1[.]1"
//Example 2:
//
//Input: address = "255.100.50.0"
//Output: "255[.]100[.]50[.]0"
//
//
//Constraints:
//
//The given address is a valid IPv4 address.

class Solution {
    func defangIPaddr(_ address: String) -> String {
        let words = address.components(separatedBy: ".")
        if words.count != 4  {
            return ""
        }
        var wordMap = ""
        var counter = 0
        for word in words {
            let val = Int(word) ?? -1
            if val > -1 && val < 256 {
                wordMap.append(word)
                if counter < 3 {
                    wordMap.append("[.]")
                }
                counter += 1
            } else {
                return ""
            }
        }
        return wordMap
    }
}
