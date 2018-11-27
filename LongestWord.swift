
// Challenge

// Using the Swift language, have the function LongestWord(sen) take the sen parameter being passed and return the largest word in the string. If there are two or more words that are the same length, return the first word from the string with that length. Ignore punctuation and assume sen will not be empty. 
// Sample Test Cases

// Input:"fun&!! time"
// Output:"time"


// Input:"I love dogs"
// Output:"love"


func LongestWord(_ sen: String) -> String {
    let words = sen.components(separatedBy: " ")
    let charactersToRemove = CharacterSet.alphanumerics.inverted
    var wordMap = [Int:String]()
    for word in words {
        let finalWrd = word.components(separatedBy: charactersToRemove).joined(separator: "")
        if wordMap[finalWrd.count] == nil {
            wordMap.updateValue(finalWrd, forKey: finalWrd.count)
        }
    }
    let sortedKeys = wordMap.keys.sorted()
    return wordMap[sortedKeys.last!]!
}
