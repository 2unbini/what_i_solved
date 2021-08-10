//DP

func solution() {
    let N = Int(readLine()!)!
    let A = readLine()!.split(separator: " ").compactMap{ Int($0) }
    var dp = Array(repeating: 0, count: N + 1)
    
    dp[0] = A[0]
    
    for i in 1..<N {
        var maxVal = 0
        
        for j in 0..<i {
            if A[i] > A[j] {
                maxVal = max(maxVal, dp[j] + A[i])
            }
        }
        
        if maxVal == 0 {
            dp[i] = A[i]
        } else {
            dp[i] = max(dp[i], maxVal)
        }
    }
    
    print(dp.max()!)
}

solution()
