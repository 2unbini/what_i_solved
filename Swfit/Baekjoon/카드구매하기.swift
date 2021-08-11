// DP

func solution() {
    let N = Int(readLine()!)!
    let P = readLine()!.split(separator: " ").compactMap{ Int($0) }
    var dp = Array(repeating: 0, count: N + 1)
    
    for i in 0..<N {
        for j in (i + 1)...N {
            dp[j] = max(dp[j], dp[j - (i + 1)] + P[i])
        }
    }
    
    print(dp[N])
}

solution()
