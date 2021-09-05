
## CompactMap{ Int($0) } => 시간초과. String->Int 맞았습니다.

class Queue<T> {
    var enqueue: [T]
    var dequeue: [T] = []
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    init(_ queue: [T]) {
        enqueue.self = queue
    }
    
    func push(_ elem: T) {
        enqueue.append(elem)
    }
    
    func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}

let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let M = input[0]
let N = input[1]
let H = input[2]
var isMatured = true
let xyz = [[0, 0, 1], [0, 0, -1], [1, 0, 0], [-1, 0, 0], [0, 1, 0], [0, -1, 0]]
var box = Array(repeating: Array(repeating: Array(repeating: 0, count: M), count: N), count: H)

for h in 0..<H {
    for n in 0..<N {
        let tomatos = readLine()!.split(separator: " ").compactMap{ Int($0) }
        if tomatos.contains(0) {
            isMatured = false
        }
        box[h][n] = tomatos
    }
}

func solution() {
    if isMatured {
        print(0)
    }
    else {
        let days = bfs()
        isAllDone() == true ? print(days - 1) : print(-1)
    }
}

func bfs() -> Int {
    var days = 0
    let queue = Queue([])
    
    for h in 0..<H {
        for n in 0..<N {
            for m in 0..<M {
                if box[h][n][m] == 1 {
                    queue.push([h, n, m])
                }
            }
        }
    }
    
    while !queue.isEmpty {
        var count = queue.count
        
        while count > 0 {
            guard let node = queue.pop() as? [Int] else { fatalError() }
            let x = node[2]
            let y = node[1]
            let z = node[0]
            
            for pos in xyz {
                let xx = x + pos[2]
                let yy = y + pos[1]
                let zz = z + pos[0]
                
                if xx >= 0 && xx < M && yy >= 0 && yy < N && zz >= 0 && zz < H && box[zz][yy][xx] == 0 {
                    queue.push([zz, yy, xx])
                    box[zz][yy][xx] = 1
                }
            }
            count -= 1
        }
        days += 1
    }
    
    return days
}

func isAllDone() -> Bool {
    
    for h in 0..<H {
        for n in 0..<N {
            let tomato = box[h][n]
            if tomato.contains(0) {
                return false
            }
        }
    }
    
    return true
}

solution()
