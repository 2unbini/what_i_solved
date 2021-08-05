// DP loop

func solution() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: Array(repeating: 1, count: 10), count: 1001)
    
    for i in 0...9 {
        dp[1][i] += i
    }
    
    if n > 1 {
        for i in 1...n {
            for j in 1...9 {
                dp[i][j] = (dp[i - 1][j] + dp[i][j - 1]) % 10007
            }
        }
    }
    
    print(dp[n][9])
}

solution()
