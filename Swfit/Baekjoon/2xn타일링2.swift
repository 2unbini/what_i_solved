// DP loop
// overflow while loop if u skip division

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

// DP recursive function

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1001)

func makeSquare(_ i: Int) -> Int {
    if i == 1 {
        return 1
    }
    if i == 2 {
        return 3
    }
    if dp[i] != 0 {
        return dp[i]
    }
    
    dp[i] = (makeSquare(i - 1) + (2 * makeSquare(i - 2))) % 10007
    
    return dp[i]
}

print(makeSquare(n))
