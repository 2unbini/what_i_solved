//DP

func solution() {
    let N = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 31)
    
    dp[0] = 1
    dp[2] = 3
    
    if (N > 3 && N % 2 == 0)
    {
        for i in 4...N {
            dp[i] += dp[i - 2] * 3
            for j in 0..<(i / 2) - 1 {
                dp[i] += dp[j * 2] * 2
            }
        }
    }
    
    print(dp[N])
}

solution()
