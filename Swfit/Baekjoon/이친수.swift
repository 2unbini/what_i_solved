// DP

func solution() {
    let N = Int(readLine()!)!
    var dp: [[Int64]] = Array(repeating: Array(repeating: 0, count: 3), count: N + 1)
    
    if N == 1 {
        print(1)
        return
    } else if N == 2 {
        print(1)
        return
    } else if N == 3 {
        print(2)
        return
    } else {
        dp[1] = [0, 1, 1]
        dp[2] = [1, 0, 1]
        dp[3] = [1, 1, 2]
        
        for i in 4...N {
            dp[i][0] = dp[i - 1][0] + dp[i - 1][1]
            dp[i][1] = dp[i - 1][0]
            dp[i][2] = (dp[i - 1][0] * 2) + dp[i - 1][1]
        }
        
        print(dp[N][2])
    }
}

solution()
