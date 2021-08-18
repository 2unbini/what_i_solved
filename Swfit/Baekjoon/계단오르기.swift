// DP

func solution() {
    let N = Int(readLine()!)!
    var stairs = Array(repeating: 0, count: N + 1)
    var dp = Array(repeating: 0, count: N + 1)
    
    for i in 1...N {
        let input = Int(readLine()!)!
        stairs[i] = input
    }
    
    dp[1] = stairs[1]
    if N > 1 {
        dp[2] = stairs[1] + stairs[2]
    }
    
    if N > 2 {
        for i in 3...N {
            dp[i] = max(dp[i - 3] + stairs[i - 1], dp[i - 2]) + stairs[i]
        }
    }
    
    print(dp[N])
}

solution()
