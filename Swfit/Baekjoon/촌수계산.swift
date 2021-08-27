

let n = Int(readLine()!)!
let target = readLine()!.split(separator: " ").compactMap{ Int($0) }
let k = Int(readLine()!)!
var childParentRelation = Array(repeating: 0, count: n + 1)
var targetRelation = Array(repeating: Array(repeating: 0, count: n + 1), count: 2)

for _ in 1...k {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    childParentRelation[input[1]] = input[0]
}

func calculateChon() {
    
    var i = target[0]
    var j = target[1]
    var ret = 10001
    
    while childParentRelation[i] != 0 {
        let parent = childParentRelation[i]
        let child = i
        targetRelation[0][parent] = targetRelation[0][child] + 1
        if parent == target[1] {
            ret = targetRelation[0][parent]
            return print(ret)
        }
        
        i = parent
    }
    
    while childParentRelation[j] != 0 {
        let parent = childParentRelation[j]
        let child = j
        targetRelation[1][parent] = targetRelation[1][child] + 1
        if parent == target[0] {
            ret = targetRelation[1][parent]
            return print(ret)
        }
        
        j = parent
    }
    
    for k in 1...n {
        if targetRelation[0][k] != 0 && targetRelation[1][k] != 0 {
            ret = min(ret, targetRelation[0][k] + targetRelation[1][k])
        }
    }
    
    print(ret == 10001 ? -1 : ret)
}

calculateChon()
