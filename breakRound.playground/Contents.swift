import UIKit


class Node
{
    var val:Int = 0
    var next:Node?
}


func isRound(node:Node?) -> Bool
{
    if node == nil {
        return false
    }
    var first:Node? = node
    var second:Node? = node?.next
    
    while first != nil && second != nil {
        if first === second {
            return true
        }
        else
        {
            first = first?.next
            second = second?.next?.next
        }
    }
    return false
}
