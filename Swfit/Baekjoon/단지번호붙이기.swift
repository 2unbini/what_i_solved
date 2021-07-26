let N = Int(readLine()!)!
var map = [[String]]()
var checked = Array(repeating: Array(repeating: false, count: N), count: N)
var xy = [[-1, 0], [1, 0], [0, -1], [0, 1]]

for _ in 0..<N {
    let value = readLine()!.compactMap { String($0) }
    map.append(value)
}

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

func bfs(position: [Int]) -> Int {
    let queue = Queue([])
    var residents = 1
    
    queue.push(position)
    checked[position[0]][position[1]] = true
    
    while queue.isEmpty == false {
        let count = queue.count
        
        for _ in 0..<count {
            guard let node = queue.pop() as? [Int] else { fatalError() }
            
            for plus in xy {
                let nextNodeX = node[0] + plus[0]
                let nextNodeY = node[1] + plus[1]
                
                if nextNodeX >= 0 && nextNodeX < N && nextNodeY >= 0 && nextNodeY < N {
                    if checked[nextNodeX][nextNodeY] == false && map[nextNodeX][nextNodeY] == "1" {
                        queue.push([nextNodeX, nextNodeY])
                        checked[nextNodeX][nextNodeY] = true
                        residents += 1
                    }
                }
            }
        }
    }
    
    return residents
}


func solution() {
    var cnt = 0
    var residentArr = [Int]()
    
    for i in 0..<N {
        for j in 0..<N {
            if checked[i][j] == true {
                continue
            } else {
                checked[i][j] = true
            }
            if map[i][j] == "1" {
                let residents = bfs(position: [i, j])
                residentArr.append(residents)
                cnt += 1
            }
        }
    }
    
    print(cnt)
    for elem in residentArr.sorted() {
        print(elem)
    }
}

solution()
