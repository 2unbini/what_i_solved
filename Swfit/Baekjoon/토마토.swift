// solved with the declaration of class 'Queue' -> passed
// to deal with timeout, use self made queue!

let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let M = input[0]
let N = input[1]
var tomatoBox = [[Int]]()
let xy = [[-1, 0], [1, 0], [0, -1], [0, 1]]

for _ in 0..<N {
    let value = readLine()!.split(separator: " ").compactMap { Int($0) }
    tomatoBox.append(value)
}

solution()

class Queue<T> {
    var enqueue: [T]
    var dequeue: [T] = []
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    init(_ queue:[T]) {
        self.enqueue = queue
    }
    
    func push(_ n: T) {
        enqueue.append(n)
    }
    
    func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}

func bfs() -> Int{
    var day = 0
    let bfsQueue = Queue([])
    
    for i in 0..<N {
        for j in 0..<M {
            if tomatoBox[i][j] == 1 {
                bfsQueue.push([i, j])
            }
        }
    }
    
    while !bfsQueue.isEmpty {
        let count = bfsQueue.count
        
        for _ in 0..<count {
            guard let node = bfsQueue.pop() as? [Int] else { fatalError() }
            
            for plus in xy {
                let nextNodeX = node[0] + plus[0]
                let nextNodeY = node[1] + plus[1]
                
                if nextNodeX >= 0 && nextNodeX < N && nextNodeY >= 0 && nextNodeY < M {
                    if tomatoBox[nextNodeX][nextNodeY] == 0 {
                        bfsQueue.push([nextNodeX, nextNodeY])
                        tomatoBox[nextNodeX][nextNodeY] = 1
                    }
                }
            }
        }
        
        day += 1
    }
    
    return day
}

func isTomatoMatured() -> Bool {
    var alreadyMatured = 0
    
    for i in tomatoBox {
        if !i.contains(0) {
            alreadyMatured += 1
        }
    }
    
    if alreadyMatured == N {
        return true
    } else {
        return false
    }
}

func solution() {
    let alreadyMatured = isTomatoMatured()
    
    if alreadyMatured {
        print(0)
        return
    }
    
    let day = bfs() - 1
    let maturedAfterDays = isTomatoMatured()
    
    maturedAfterDays == true ? print(day) : print(-1)
}



// tried to solve with two dimension array(bfsQueue) -> failed (timeout)
// have to remove useless array(check) and function(getMatureTomato)

let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let M = input[0]
let N = input[1]
var tomatoBox = [[Int]]()
var checked = Array(repeating: Array(repeating: false, count: M), count: N)
var bfsQueue = [[Int]]()
let xy = [[-1, 0], [1, 0], [0, -1], [0, 1]]

for _ in 0..<N {
    let value = readLine()!.split(separator: " ").compactMap { Int($0) }
    tomatoBox.append(value)
}

func getMatureTomato() -> [[Int]] {
    var ret = [[Int]]()
    
    for i in 0..<N {
        for j in 0..<M {
            if tomatoBox[i][j] == 1 {
                ret.append([i, j])
            }
        }
    }
    
    return ret
}

func bfs() -> Int{
    var day = 0
    
    bfsQueue += getMatureTomato()
    for arr in getMatureTomato() {
        checked[arr[0]][arr[1]] = true
    }
    
    while !bfsQueue.isEmpty {
        let count = bfsQueue.count
        
        for _ in 0..<count {
            let node = bfsQueue.removeFirst()
            
            for plus in xy {
                let nextNodeX = node[0] + plus[0]
                let nextNodeY = node[1] + plus[1]
                
                if nextNodeX >= 0 && nextNodeX < N && nextNodeY >= 0 && nextNodeY < M {
                    if tomatoBox[nextNodeX][nextNodeY] == 0 && checked[nextNodeX][nextNodeY] == false {
                        bfsQueue.append([nextNodeX, nextNodeY])
                        tomatoBox[nextNodeX][nextNodeY] = 1
                        checked[nextNodeX][nextNodeY] = true
                    }
                }
            }
        }
        
        day += 1
    }
    
    return day
}

func isTomatoMatured() -> Bool {
    var alreadyMatured = 0
    
    for i in tomatoBox {
        if !i.contains(0) {
            alreadyMatured += 1
        }
    }
    
    if alreadyMatured == N {
        return true
    } else {
        return false
    }
}

func solution() {
    let alreadyMatured = isTomatoMatured()
    
    if alreadyMatured {
        print(0)
        return
    }
    
    let day = bfs() - 1
    let maturedAfterDays = isTomatoMatured()
    
    maturedAfterDays == true ? print(day) : print(-1)
}

solution()
