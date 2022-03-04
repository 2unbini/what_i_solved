import Foundation

// dfs

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var networkCount = 0
    var visited = Array(repeating: false, count: n)
    
    for i in 0..<n {
        if !visited[i] {
            networkCount += dfs(i, &visited, computers, n)    
        }
    }
    
    return networkCount
}

func dfs(_ i: Int, _ visited: inout [Bool], _ computers: [[Int]], _ n: Int) -> Int {
      if visited[i] {
          return 0
      }

      visited[i] = true

      for j in 0..<n {
          if i != j && computers[i][j] == 1 {
              dfs(j, &visited, computers, n)
          }
      }

      return 1
  }
