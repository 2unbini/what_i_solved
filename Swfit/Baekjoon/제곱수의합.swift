//DP

func solution() {
    let N = Int(readLine()!)!
    var dp = Array(repeating: 100001, count: N + 1)
    
    for i in 1...N {
        for j in 1...N {
            if i == j * j {
                dp[i] = 1
            }
            else if i > j * j {
                dp[i] = min(dp[i], min(dp[i - 1] + 1, dp[i - (j * j)] + 1))
            }
            else {
                break
            }
        }
    }
    
    print(dp[N])
}

solution()
