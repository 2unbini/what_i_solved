// BFS

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
let F = input[0]
let S = input[1]
let G = input[2]
let U = input[3]
let D = input[4]

var moves = Array(repeating: -1, count: F + 1)
var stair = false

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

func solution() {
    let ret = bfs()
    
    if ret == -1 {
        print("use the stairs")
    } else {
        print(moves[G])
    }
}

func bfs() -> Int {
    var queue = Queue(enqueue: [], dequeue: [])
    
    queue.push(S)
    moves[S] = 0
    
    while !queue.isEmpty {
        guard let floor = queue.pop() as? Int else { fatalError() }
        
        if floor == G {
            return moves[floor]
        }
        
        let up = floor + U
        let down = floor - D
        
        if up > 0 && up <= F && moves[up] == -1 {
            queue.push(up)
            moves[up] = moves[floor] + 1
        }
        
        if down > 0 && down <= F && moves[down] == -1 {
            queue.push(down)
            moves[down] = moves[floor] + 1
        }
    }
    
    return moves[G]
}

solution()
