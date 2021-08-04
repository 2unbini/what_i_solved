// solved with dp
// dp[n] is the minimum value of these three values: op(n - 1) + 1, op(n / 2) + 1, op(n / 3) + 1

let N = Int(readLine()!)!
var dp = Array(repeating: 1000001, count: N + 1)

func operation(_ n: Int) -> Int {
    var minVal = 1000001
    
    if n == 0 || n == 1 {
        return 0
    }
    else if n == 2 || n == 3 {
        return 1
    }
    else {
        
        if dp[n] != 1000001 {
            return dp[n]
        }

        let caseOne = operation(n - 1) + 1
        var caseTwo = 1000001
        var caseThree = 1000001
            
        minVal = min(minVal, caseOne)
            
        if n % 2 == 0 {
            caseTwo = operation(n / 2) + 1
        }
        if n % 3 == 0 {
            caseThree = operation(n / 3) + 1
        }
        
        let minValTwo = min(caseTwo, caseThree)
        dp[n] = min(minVal, minValTwo)
        
        return dp[n]
    }
}

print(operation(N))
