// bfs

let N = Int(readLine()!)!
var map = [[Int]]()
var checked = Array(repeating: Array(repeating: false, count: N), count: N)
var queue = [[Int]]()
var maxHeight = 0

for _ in 1...N {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    map.append(input)
    maxHeight = max(maxHeight, input.max()!)
}

func solution() {
    
    var maxSafeArea = 0
    
    for k in 0...maxHeight {
        var safeArea = 0
        
        for i in 0..<N {
            for j in 0..<N {
                checked[i][j] = false
            }
        }
        
        for i in 0..<N {
            for j in 0..<N {
                
                if !checked[i][j] && map[i][j] > k {
                    bfs(i, j, k)
                    safeArea += 1
                }
            }
        }
        
        maxSafeArea = max(maxSafeArea, safeArea)
    }
    
    print(maxSafeArea)
}

func bfs(_ i: Int, _ j: Int, _ currentH: Int) {
    
    queue.append([i, j])
    checked[i][j] = true
    
    while !queue.isEmpty {
        let node = queue.removeFirst()

        if node[0] < N - 1 && !checked[node[0] + 1][node[1]] && map[node[0] + 1][node[1]] > currentH {
            checked[node[0] + 1][node[1]] = true
            queue.append([node[0] + 1, node[1]])
        }
        if node[1] < N - 1 && !checked[node[0]][node[1] + 1] && map[node[0]][node[1] + 1] > currentH {
            checked[node[0]][node[1] + 1] = true
            queue.append([node[0], node[1] + 1])
        }
        if node[0] > 0 && !checked[node[0] - 1][node[1]] && map[node[0] - 1][node[1]] > currentH {
            checked[node[0] - 1][node[1]] = true
            queue.append([node[0] - 1, node[1]])
        }
        if node[1] > 0 && !checked[node[0]][node[1] - 1] && map[node[0]][node[1] - 1] > currentH {
            checked[node[0]][node[1] - 1] = true
            queue.append([node[0], node[1] - 1])
        }
    }
}

solution()
