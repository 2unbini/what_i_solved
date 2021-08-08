// DP
// 전체 점화식을 세워놓고 예외처리 해나가자

func solution() -> Int {
    let N = Int(readLine()!)!
    var dp = Array(repeating: Array(repeating: 0, count: 10), count: 101)
    var sum = 0
    let divisor = 1000000000
    dp[1] = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    
    if N == 1 {
        return 9
    }
    if N == 2 {
        return 17
    }
    
    for i in 2...N {
        for j in 0...9 {
            if j == 0 {
                dp[i][j] = dp[i - 1][j + 1] % divisor
            }
            else if j == 9 {
                dp[i][j] = dp[i - 1][j - 1] % divisor
            }
            else {
                dp[i][j] = dp[i - 1][j + 1] + dp[i - 1][j - 1] % divisor
            }
        }
    }
    
    for i in 1...9 {
        sum = (sum + dp[N][i]) % divisor
    }
    
    return sum
}

print(solution())

