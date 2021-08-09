// DP
// 시간초과(메모이제이션 없이) -> 메모리초과(solution 함수에서 리턴 조건이 잘못됐음) -> 맞았습니다!!

let N = Int(readLine()!)!
var numArr = [[Int]]()
var dp: [[Int64]] = Array(repeating: Array(repeating: -1, count: N + 1), count: N + 1)

for _ in 0..<N {
    let val = readLine()!.split(separator: " ").compactMap{ Int($0) }
    numArr.append(val)
}

func solution(_ i: Int, _ j: Int) -> Int64 {
    if i == N - 1 && j == N - 1 {
        return 1
    }
    
    if dp[i][j] == -1 {
        let move = numArr[i][j]
        dp[i][j] = 0
        
        if j + move < N && i < N {
            dp[i][j] += solution(i, j + move)
        }
        if i + move < N && j < N {
            dp[i][j] += solution(i + move, j)
        }
    }
    
    return dp[i][j]
}

print(solution(0, 0))
