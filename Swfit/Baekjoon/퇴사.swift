// DP
// 점화식 익숙해지자 ㅜ

func solution() {
    let N = Int(readLine()!)!
    var T = [Int]()
    var P = [Int]()
    
    for _ in 0..<N {
        let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
        T.append(input[0])
        P.append(input[1])
    }
    
    var dp = Array(repeating: 0, count: N + 2)
    
    for i in 0..<N {
        if i + T[i] <= N {
            dp[i + T[i]] = max(dp[i + T[i]], dp[i] + P[i])
        }
        dp[i + 1] = max(dp[i + 1], dp[i])
    }
    
    print(dp.max()!)
}

solution()
