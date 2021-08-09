//DP

let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let M = input[0]
let N = input[1]
var numArr = [[Int]]()
var dp: [[Int64]] = Array(repeating: Array(repeating: -1, count: N + 1), count: M + 1)
let move = 1

for _ in 0..<M {
    let val = readLine()!.split(separator: " ").compactMap{ Int($0) }
    numArr.append(val)
}

func solution(_ i: Int, _ j: Int) -> Int64 {
    if i == M - 1 && j == N - 1 {
        return 1
    }
    
    if dp[i][j] == -1 {
        let height = numArr[i][j]
        dp[i][j] = 0
        
        if i + move < M && (j >= 0 && j < N) && height > numArr[i + move][j] {
            dp[i][j] += solution(i + move, j)
        }
        if j + move < N && (i >= 0 && i < M) && height > numArr[i][j + move]{
            dp[i][j] += solution(i, j + move)
        }
        if i - move >= 0 && (j >= 0 && j < N) && height > numArr[i - move][j]{
            dp[i][j] += solution(i - move, j)
        }
        if j - move >= 0 && (i >= 0 && i < M) && height > numArr[i][j - move]{
            dp[i][j] += solution(i, j - move)
        }
    }
    
    return dp[i][j]
}

print(solution(0, 0))
