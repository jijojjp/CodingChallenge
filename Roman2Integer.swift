/*
Given a roman numeral, convert it to an integer.

Input is guaranteed to be within the range from 1 to 3999.
*/

// Slower runtime.
// This function returns value of a Roman symbol
func convert(_ r :Character) -> Int {
    switch r {
        case "I" : return 1
        case "V" : return 5
        case "X" : return 10
        case "L" : return 50
        case "C" : return 100
        case "D" : return 500
        case "M" : return 1000
        default : return -1
    }
}

class Solutions {
    func romanToInt(_ s: String) -> Int {
        var result = 0
        let val = [Character](s.characters)
        for i in 0..<val.count-1 {
            let char = convert(val[i])
            if char >= convert(val[i+1]) {
                result += char
            }else{
                result -= char
            }
        }
        result += convert(val[val.count-1])
        return result
    }
}


Solutions().romanToInt("MCMXCVI")
Solutions().romanToInt("V")


// Faster runtime.

class Solution {
    func romanToInt(_ s: String) -> Int {
        let dict : [Character: Int] = ["I": 1,
                                       "V" : 5,
                                       "X" : 10,
                                       "L" : 50,
                                       "C" : 100,
                                       "D" : 500,
                                       "M" : 1000]
        
        var result = 0
        let val = [Character](s.characters)
        for i in 0..<val.count-1 {
            let char = dict[val[i]]! as Int
            if char >= dict[val[i+1]]! {
                result += char
            }else{
                result -= char
            }
        }
        result += dict[val[val.count-1]]!
        return result
    }
}

Solution().romanToInt("MCMXCVI")
Solution().romanToInt("V")
