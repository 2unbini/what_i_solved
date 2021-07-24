// solved with graph -> passed

let value = readLine()!.split(separator: " ").compactMap{ Int($0) }
let N = value[0]
let M = value[1]
let V = value[2]
var graph = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)
var visited = Array(repeating: 0, count: N + 1)
var dfsReturnArray = [Int]()
var bfsReturnArray = [Int]()
var bfsQueue = [Int]()

for _ in 0..<M {
    let value = readLine()!.split(separator: " ").compactMap{ Int($0) }
    graph[value[0]][value[1]] = 1
    graph[value[1]][value[0]] = 1
}

func dfs(checkNum: Int) {
    if visited[checkNum] == 1 {
        return
    } else {
        visited[checkNum] = 1
        dfsReturnArray.append(checkNum)
    }
    
    for i in 1...N {
        if graph[checkNum][i] == 1 {
            dfs(checkNum: i)
        }
    }
}

func bfs(checkNum: Int) {
    var visited = Array(repeating: 0, count: N + 1)
    bfsQueue.append(checkNum)
    visited[checkNum] = 1
    
    while !bfsQueue.isEmpty {
        let node = bfsQueue.removeFirst()
        if bfsReturnArray.contains(node) == false {
            bfsReturnArray.append(node)
        }
        
        for i in 1...N {
            if graph[node][i] == 1 {
                let nextNode = i
                if visited[nextNode] == 0 {
                    bfsQueue.append(nextNode)
                    visited[nextNode] = 1
                    bfsReturnArray.append(nextNode)
                }
            }
        }
    }
}

func solution() {
    var dfsRet = ""
    var bfsRet = ""

    dfs(checkNum: V)
    bfs(checkNum: V)
    for i in 0..<dfsReturnArray.count {
        dfsRet += i == dfsReturnArray.count - 1 ? String(dfsReturnArray[i]) : String(dfsReturnArray[i]) + " "
        bfsRet += i == bfsReturnArray.count - 1 ? String(bfsReturnArray[i]) : String(bfsReturnArray[i]) + " "
    }
    print(dfsRet)
    print(bfsRet)
}

solution()



// tried with array that contains the connection between nodes -> failed
// what I missed was the order of source node's connection

let value = readLine()!.split(separator: " ").compactMap{ Int($0) }
let N = value[0]
let M = value[1]
let V = value[2]
var connectedArray = [[Int]]()
var visited = Array(repeating: 0, count: N)
var dfsReturnArray = [Int]()
var bfsReturnArray = [Int]()
var bfsQueue = [Int]()

for _ in 0..<M {
    let value = readLine()!.split(separator: " ").compactMap{ Int($0) }
    connectedArray.append(value)
}

// sorting array by first index0, second index1
connectedArray = connectedArray.sorted { (a, b) -> Bool in
    if a[0] == b[0] {
        return a[1] < b[1]
    } else {
        return a[0] < b[0]
    }
}

// dfs
func dfs(checkNum: Int) {
    if visited[checkNum - 1] == 1 {
        return
    } else {
        visited[checkNum - 1] = 1
        dfsReturnArray.append(checkNum)
    }
    
    for connection in connectedArray {
        if checkNum == connection[0] {
            dfs(checkNum: connection[1])
        } else if checkNum == connection[1] {
            dfs(checkNum: connection[0])
        }
    }
}

func bfs(checkNum: Int) {
    var visited = Array(repeating: 0, count: N)
    bfsQueue.append(checkNum)
    visited[checkNum - 1] = 1
    
    while !bfsQueue.isEmpty {
        let node = bfsQueue.removeFirst()
        if bfsReturnArray.contains(node) == false {
            bfsReturnArray.append(node)
        }
        
        for connection in connectedArray {
            if node == connection[0] {
                let nextNode = connection[1]
                if visited[nextNode - 1] == 0 {
                    bfsQueue.append(nextNode)
                    visited[nextNode - 1] = 1
                    bfsReturnArray.append(nextNode)
                }
            } else if node == connection[1] {
                let nextNode = connection[0]
                if visited[nextNode - 1] == 0 {
                    bfsQueue.append(nextNode)
                    visited[nextNode - 1] = 1
                    bfsReturnArray.append(nextNode)
                }
            }
        }
    }
}

func solution() {
    var dfsRet = ""
    var bfsRet = ""

    dfs(checkNum: V)
    bfs(checkNum: V)
    for i in 0..<dfsReturnArray.count {
        dfsRet += i == dfsReturnArray.count - 1 ? String(dfsReturnArray[i]) : String(dfsReturnArray[i]) + " "
        bfsRet += i == bfsReturnArray.count - 1 ? String(bfsReturnArray[i]) : String(bfsReturnArray[i]) + " "
    }
    print(dfsRet)
    print(bfsRet)

}

solution()

// counterexample
/*
 10 10 4
 5 4
 6 4
 6 8
 8 9
 1 10
 2 10
 10 3
 8 2
 1 7
 4 10
 
 4 5 6 8 2 10 1 7 3 9
 4 5 6 10 8 1 2 3 9 7
 */

/*
 6 8 1
 1 6
 6 2
 2 4
 4 3
 3 5
 5 1
 5 6
 2 3
 
 1 5 3 2 4 6
 1 5 6 3 2 4
 */
