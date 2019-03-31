import UIKit


func mergeStones(_ stones: [Int], _ K: Int) -> Int {
    let count = stones.count
    if count < K || K <= 0 {
        return -1
    }
    var ret = count
    while ret >= K {
        ret = ret % K + ret/K
    }
    if ret != 1 {
        return -1
    }
    var copyStones = stones
    var cost = 0
    while copyStones.count >= K {
        var minSumStartIndex = 0
        var minSum = 0
        
        for i in 0..<(count-K+1) {
            var sum = 0
            for j in 0..<K {
                sum += copyStones[i+j]
            }
            if minSum == 0 {
                minSum = sum
                continue
            }
            else if minSum > sum {
                minSum = sum
                minSumStartIndex = i
            }
        }
        cost += minSum
        for j in 0..<K+1 {
            copyStones.remove(at: minSumStartIndex + j)
        }
        copyStones.insert(minSum, at: minSumStartIndex)
    }
    return cost
    
    
    
}

let stones = [3,5,1,2,6]
let output = mergeStones(stones, 3)


for i in 0..<1 {
    print(i)
}
