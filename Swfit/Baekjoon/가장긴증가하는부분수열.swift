// DP
// 이런 류의 문제 아직 어려움..

func solution() {
    let N = Int(readLine()!)!
    let A = readLine()!.split(separator: " ").compactMap{ Int($0) }
    var dp = Array(repeating: 1, count: N + 1)
    
    for i in 0..<N {
        var maxVal = 0
        
        for j in 0..<i {
            if A[i] > A[j] {
                maxVal = max(maxVal, dp[j] + 1)
            }
        }
        
        dp[i] = max(dp[i], maxVal)
    }
    
    print(dp.max()!)
}

solution()
