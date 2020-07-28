//Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 231 - 1.
//
//Example 1:
//
//Input: 123
//Output: "One Hundred Twenty Three"
//Example 2:
//
//Input: 12345
//Output: "Twelve Thousand Three Hundred Forty Five"
//Example 3:
//
//Input: 1234567
//Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
//Example 4:
//
//Input: 1234567891
//Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"

class Solution {
    func numberToWords(_ num: Int) -> String {
        if num == 0 { return "Zero" }
        var n = num
        var result = ""
        var mag = 0
        
        while (n > 0) {
            if (n % 1000 != 0) {
                result = getValue(n % 1000) + getMagnitude(mag) + result
            }
            
            mag += 1
            n /= 1000
        }
        return result.trimmingCharacters(in: .whitespaces)
    }
    
    func getMagnitude(_ mag: Int) -> String {
        if mag == 1 { return " Thousand" }
        if mag == 2 { return " Million" }
        if mag == 3 { return " Billion" }
        else { return "" }
    }
    
    func getValue (_ value : Int) -> String {
        if value == 0 { return ""}
        else if value >= 100 { return " " + getTwenty(value / 100) + " Hundred" + getValue(value%100)}
        else if value >= 20 { return " " + getTenth(value / 10) + getValue(value%10)}
        else {return " " + getTwenty(value)}
    }
    
    func getTwenty(_ val : Int) -> String {
        let result = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
        return result [val%20]
    }
    
    func getTenth(_ val : Int) -> String {
        let result = ["Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
        return result[val-2]
    }
}
