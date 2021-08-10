//DP

func solution() {
    let N = Int(readLine()!)!
    let A = readLine()!.split(separator: " ").compactMap { Int($0) }
    var dp = Array(repeating: 1, count: N + 1)
    
    for i in 1..<N {
        var maxLen = 0
        
        for j in 0..<i {
            if A[i] < A[j] {
                maxLen = max(maxLen, dp[j] + 1)
            }
        }
        
        dp[i] = max(dp[i], maxLen)
    }
    
    print(dp.max()!)
}

solution()
