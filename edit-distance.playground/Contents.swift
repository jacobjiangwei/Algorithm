import UIKit

func minDistance(_ word1: String, _ word2: String) -> Int {
    let gap = abs(word2.count - word1.count)
    if word1.count == 0 || word2.count == 0 {
        return gap
    }
    
    if word1.count == word2.count {
        let index1 = 0
        let index2 = 0
        
    }
}

let d1 = minDistance("house", "horse")
let d2 = minDistance("aaaa", "a")
let d3 = minDistance("abc", "bcbc")
let d4 = minDistance("abc", "")
let d5 = minDistance("abcdefg", "bcdefga")
let d6 = minDistance("abcxxxxxdef", "abcdef")
let d7 = minDistance("abcdabc", "abeab")
