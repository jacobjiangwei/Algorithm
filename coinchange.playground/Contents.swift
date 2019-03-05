import UIKit

/*
 Input: coins = [1, 2, 5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1
 Example 2:
 
 Input: coins = [2], amount = 3
 Output: -1
 */

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    guard amount != 0 else {
        return 0
    }
    if coins.count < 0 {
        return -1
    }
    var climbCoins:[Int:Int] = [:]
    for i in 0...amount {
        for coin in coins {
            if i == coin {
                climbCoins[i] = 1
            }
            else if climbCoins[i-coin] != nil {
                if climbCoins[i] != nil {
                    climbCoins[i] = min(climbCoins[i-coin]! + 1, climbCoins[i]!)
                }
                else
                {
                    climbCoins[i] = climbCoins[i-coin]! + 1
                }
            }
        }
    }
    
    if climbCoins[amount] != nil {
        return climbCoins[amount]!
    }
    
    return -1
}


let d = coinChange([186,419,83,408], 6249)
print(d)
