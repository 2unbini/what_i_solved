// DP loop
// overflow while loop if u skip divide 10007

func solution() {
    let n = Int(readLine()!)!
    var dp: [Int64] = Array(repeating: 0, count: 1001)
    
    dp[1] = 1
    dp[2] = 3
    
    if n > 2 {
        for i in 3...n {
            dp[i] = (dp[i - 1] + (2 * dp[i - 2])) % 10007
        }
    }
    
    print(dp[n])
}

solution()
