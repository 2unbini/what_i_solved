// bfs
// 시간초과 오지게 나서 무슨 문젠가 했는데 while문 조건 잘못 써서 그런거였다. 스위프트 탓 하지 말자^^... 

let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let N = input[0]
let M = input[1]

var year = 0
var map = [[Int]]()
var xy = [[1, 0], [-1, 0], [0, 1], [0, -1]]

for _ in 1...N {
    let val = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
    map.append(val)
}

func isAllMelted() -> Bool {
    for i in 0..<N {
        for j in 0..<M {
            if map[i][j] != 0 {
                return false
            }
        }
    }
    
    return true
}

func solution() {
    while true {
        var area = 0
        var checked = Array(repeating: Array(repeating: false, count: M), count: N)
        var meltedMap = map
        
        for i in 1..<N-1 {
            for j in 1..<M-1 {
                if map[i][j] != 0 && !checked[i][j] {
                    var queue = [(n: Int, m: Int)]()
                    
                    queue.append((i, j))
                    checked[i][j] = true
                    
                    while !queue.isEmpty {
                        var meltAmount = 0
                        let node = queue.removeFirst()
                        
                        for pos in xy {
                            let ii = node.n + pos[0]
                            let jj = node.m + pos[1]
                            
                            if ii >= 0 && ii < N && jj >= 0 && jj < M {
                                if !checked[ii][jj] && map[ii][jj] != 0 {
                                    queue.append((ii, jj))
                                    checked[ii][jj] = true
                                }
                                if map[ii][jj] == 0 {
                                    meltAmount += 1
                                }
                            }
                        }
                        
                        meltedMap[node.n][node.m] -= meltAmount
                        if meltedMap[node.n][node.m] < 0 { meltedMap[node.n][node.m] = 0 }
                    }
                    area += 1
                }
            }
        }
        
        map = meltedMap
        
        if area == 1 && isAllMelted() {
            year = 0
            break
        }
        else if area > 1 {
            break
        }
        
        year += 1
    }

    print(year)
}

solution()



// 시간초과 날까봐 큐 구현해서 푼 풀이.. 근데 오히려 시간은 굳이 구현 안한 게 더 빨랐다,,ㅜㅜ
// 함수 만들어서 쓰면 시간 더 걸릴거라 생각했는데 아니었음..

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
let N = input[0]
let M = input[1]

let xy = [[1, 0], [-1, 0], [0, 1], [0, -1]]
var map = [[Int]]()

for _ in 1...N {
    let val = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
    map.append(val)
}

struct Queue<T> {
    var enqueue: [T]
    var dequeue: [T]
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    mutating func push(_ elem: T) {
        enqueue.append(elem)
    }
    
    mutating func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        
        return dequeue.popLast()
    }
}

func allMelted() -> Bool {
    
    for i in 0..<N {
        for j in 0..<M {
            if map[i][j] != 0 {
                return false
            }
        }
    }
    
    return true
}

func solution() {
    var area = 0
    var year = 0
    
    while true {
        var checked = Array(repeating: Array(repeating: 0, count: M), count: N)
        area = 0
        
        for i in 0..<N {
            for j in 0..<M {
                if map[i][j] != 0 && checked[i][j] == 0 {
                    var queue = Queue(enqueue: [], dequeue: [])
                    var meltedMap = map
                    
                    queue.push([i, j])
                    checked[i][j] = 1
                    
                    while !queue.isEmpty {
                        guard let node = queue.pop() as? [Int] else { fatalError() }
                        var meltAmount = 0
                        
                        for pos in xy {
                            let ii = node[0] + pos[0]
                            let jj = node[1] + pos[1]
                            
                            if ii >= 0 && ii < N && jj >= 0 && jj < M {
                                if map[ii][jj] != 0 && checked[ii][jj] == 0  {
                                    queue.push([ii, jj])
                                    checked[ii][jj] = 1
                                }
                                if map[ii][jj] == 0 {
                                    meltAmount += 1
                                }
                            }
                        }
                        
                        if meltedMap[node[0]][node[1]] < meltAmount {
                            meltedMap[node[0]][node[1]] = 0
                        } else {
                            meltedMap[node[0]][node[1]] -= meltAmount
                        }
                    }
                    map = meltedMap
                    area += 1
                }
            }
        }
        
        if allMelted() && area == 1 {
            year = 0
            break
        }
        if area > 1 {
            break
        }
        
        year += 1
    }
    
    print(year)
}

solution()
