// DP

func solution() {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let N = input[0]
    let K = input[1]
    var dp = Array(repeating: Array(repeating: 1, count: K + 2), count: N + 2)
    let mod = 1000000000
    
    for i in 0...N {
        dp[i][1] = 1
        dp[i][2] = i + 1
    }
    
    if K > 2 {
        for j in 3...K {
            for i in 1...N {
                dp[i][j] = (dp[i - 1][j] % mod) + (dp[i][j - 1] % mod)
            }
        }
    }
    
    print(dp[N][K] % mod)
}

solution()
