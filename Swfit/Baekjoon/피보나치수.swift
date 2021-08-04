// solved with DP
// using loop

func solution() {
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 50)
    
    dp[0] = 0
    dp[1] = 1
    if (n > 1) {
        for i in 2...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
    }
    print(dp[n])
}

solution()

// using recursive func

var dp = Array(repeating: 0, count: 50)

func recursive(_ n: Int) -> Int {
    if n < 2 {
        return n
    }
    else {
        if (dp[n] != 0) {
            return dp[n]
        }
        dp[n] = recursive(n - 1) + recursive(n - 2)
        return dp[n]
    }
}

func solution() {
    let n = Int(readLine()!)!
    
    dp[0] = 0
    dp[1] = 1
    print(recursive(n))
}

solution()
