class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        dp[0][1] = 1
        
        for i in 1...m {
            for j in 1...n {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        
        return dp[m][n]
    }
}


// by single Array

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: 1, count: n + 1)
        
        for i in 1..<m {
            for j in 1...n {
                dp[j] += dp[j - 1]
            }
        }
        
        return dp[n - 1]
    }
}
