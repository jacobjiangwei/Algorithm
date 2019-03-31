import UIKit

func commonChars(_ A: [String]) -> [String] {
    if A.count < 2 {
        return []
    }
    var dic:[Character:[Int]] = [:]
    for str in A {
        var tmpDic:[Character:[Int]] = [:]
        for c in str {
            if tmpDic[c] == nil {
                tmpDic[c] = [1]
            }
            else
            {
                tmpDic[c] = [tmpDic[c]!.first! + 1]
            }
        }
        for item in tmpDic {
            if dic[item.key] == nil {
                dic[item.key] = item.value
            }
            else
            {
                var existValue = dic[item.key]!
                existValue.append(item.value.first!)
                dic[item.key] = existValue
            }
        }
    }
    
    var result:[String] = []
    for item in dic {
        let count = item.value.count
        if count != A.count {
            continue
        }
        let min = item.value.min()!
        for i in 0..<min {
            result.append("\(item.key)")
        }
    }
    return result
}

let test = ["cool","lock","cook"]
let d = commonChars(test)
