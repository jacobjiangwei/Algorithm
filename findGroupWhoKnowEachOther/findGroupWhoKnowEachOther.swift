//
//  main.swift
//  algorithem
//
//  Created by Jacob Jiang on 3/3/19.
//  Copyright © 2019 Jacob Jiang. All rights reserved.
//

import Foundation

print("Hello, World!")


class Pool {
    var peopleData:[Int:Bool] = [:]
    var people:[Int] = []
    var size = 0
    func addPeople(node:Node) {
        if peopleData[node.id] != nil {
            return
        }
        peopleData[node.id] = true
        size += 1
        people.append(node.id)
    }
}

class Node {
    var id = 0
    var friends:[Node] = []
    var friendStatus:[Int:Bool] = [:]
    public init(id:Int) {
        self.id = id
    }
    
    func addFriend(node:Node) {
        friends.append(node)
        friendStatus[node.id] = true
    }
    
    var description:String {
        var result = "Node:\(id) \n Friends:"
        for friend in friends {
            result += "\(friend.id) "
        }
        return result
    }
    
}


extension Node:Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }
}


var inputData:[Node] = []
for i in 0...4000 {
    let newNode = Node(id: i)
    inputData.append(newNode)
}

var copyOfInputData = inputData.shuffled()
for item in inputData {
    for newFriendIndex in item.friends.count..<100 {
        let newFriend = copyOfInputData[newFriendIndex]
        if newFriend.friends.count < 100 {
            item.addFriend(node: newFriend)
            newFriend.addFriend(node: item)
        }
    }
    copyOfInputData = copyOfInputData.shuffled()
}


func findSmallGroups(size:Int,source:[Node]) -> [Pool] {
    let methodStart = Date()
    var pools:[Pool] = []
    for item in source {
        let pool = Pool()
        pool.addPeople(node: item)
        pools.append(pool)
    }
    
    for item in source {
        for friend in item.friends {
            let pool = pools[friend.id]
            var allFriend = true
            for people in pool.people {
                if item.friendStatus[people] == nil {
                    allFriend = false
                    continue
                }
            }
            if allFriend {
                pools[friend.id].addPeople(node: item)
            }
        }
        print("start deal with item:\(item.id)")
    }
    
    let result = pools.filter {
        return $0.people.count >= size
    }
    
    let lastCheck = result.last!
    
    for item in lastCheck.people {
        print(inputData[item].description)
    }
    let methodFinish = Date()
    let executionTime = methodFinish.timeIntervalSince(methodStart)
    print("Execution time: \(executionTime)")
    return result
}


findSmallGroups(size: 4, source: inputData)
