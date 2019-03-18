import UIKit


class Solution {
    private var originNum :[Int] = []
    init(_ nums: [Int]) {
        originNum = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return originNum
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        var result:[Int] = []
        var copyOrin = originNum
        
        while copyOrin.count > 0 {
            let random = Int.random(in: 0..<copyOrin.count)
            result.append(copyOrin[random])
            copyOrin.remove(at: random)
        }
        return result
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */

let obj = Solution([1,2,3,6,5])
let ret1 = obj.reset()
let ret2 = obj.shuffle()
