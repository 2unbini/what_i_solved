// DP

func solution() {
    let T = Int(readLine()!)!
   
    for _ in 0..<T {
        let n = Int(readLine()!)!
        var dp = Array(repeating: 0, count: 12)
        
        dp[1] = 1
        dp[2] = 2
        dp[3] = 4
        
        if n > 3 {
            for j in 4...n {
                dp[j] = dp[j - 1] + dp[j - 2] + dp[j - 3]
            }
        }
        
        print(dp[n])
    }
}

solution()
