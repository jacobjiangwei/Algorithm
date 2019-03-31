import UIKit


func smallestRepunitDivByK(_ K: Int) -> Int {
    
//    var value:Int = 0
//    var length:Int = 0
//    for i in 0..<Int(1e6)
//    {
//        value = (10*value + 1) % K
//        length += 1
//        if value == 0 { return length }
//    }
//    return -1
    
    if K == 1 {
        return 1
    }
    var numStr = "1"
    var num:Int64? = Int64(numStr)!
    while num != nil && num! <= Int64.max {
        if num! % Int64(K) == 0 {
            return numStr.count
        }
        else
        {
            numStr.append("1")
            num = Int64(numStr)
        }
    }
    return -1
}

let d = smallestRepunitDivByK(1)

let e = smallestRepunitDivByK(2)

let f = smallestRepunitDivByK(23)
