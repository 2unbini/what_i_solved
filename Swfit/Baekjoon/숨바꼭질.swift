// Runtime Error => may be the reason Out of bounds
// fixed isValid function

let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let N = input[0]
let K = input[1]
var visitedQ = Array(repeating: false, count: 100001)
let waitingQ = Queue([])

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

func isValid(pos: Int) -> Bool {
    if pos >= 0 && pos <= 100000 && !visitedQ[pos] {
        return true
    }
    return false
}

func bfs() {
    waitingQ.push([0, N])
    visitedQ[N] = true
    
    while !waitingQ.isEmpty {
        guard let node = waitingQ.pop() as? [Int] else { fatalError() }
        let level = node[0]
        let pos = node[1]
            
        if pos == K {
            print(level)
            break
        }
        
        if isValid(pos: pos + 1) {
            waitingQ.push([level + 1, pos + 1])
            visitedQ[pos + 1] = true
        }
        if isValid(pos: pos - 1) {
            waitingQ.push([level + 1, pos - 1])
            visitedQ[pos - 1] = true
        }
        if isValid(pos: pos * 2) {
            waitingQ.push([level + 1, pos * 2])
            visitedQ[pos * 2] = true
        }
    }
}

bfs()
