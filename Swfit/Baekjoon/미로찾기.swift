// BFS

let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let N = input[0]
let M = input[1]
var map = [[Int]]()
for _ in 1...N {
    let value = readLine()!.compactMap{ Int(String($0)) }
    map.append(value)
}
var d = Array(repeating: Array(repeating: 100001, count: M), count: N)

func bfs() {
    var queue = [[Int]]()
    queue.append([1, 0])
    queue.append([0, 1])
    
    d[0][0] = 1
    
    while !queue.isEmpty {
        let head: [Int] = queue.removeFirst()
        var minVal = 100001
        
        if map[head[0]][head[1]] == 1 && d[head[0]][head[1]] == 100001 {
            d[head[0]][head[1]] = 1
            
            if head[0] > 0 {
                queue.append([head[0] - 1, head[1]])
                minVal = min(minVal, d[head[0] - 1][head[1]])
            }
            if head[1] > 0 {
                queue.append([head[0], head[1] - 1])
                minVal = min(minVal, d[head[0]][head[1] - 1])
            }
            if head[0] < N - 1 {
                queue.append([head[0] + 1, head[1]])
                minVal = min(minVal, d[head[0] + 1][head[1]])
            }
            if head[1] < M - 1 {
                queue.append([head[0], head[1] + 1])
                minVal = min(minVal, d[head[0]][head[1] + 1])
            }

            if minVal == 100001 {
                minVal = 0
            }
            d[head[0]][head[1]] += minVal
        }
    }
    
    print(d[N - 1][M - 1] == 100001 ? 0 : d[N - 1][M - 1])
}

bfs()
