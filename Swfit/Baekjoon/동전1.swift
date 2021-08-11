// DP
// 2147483648로 나머지 연산 안하면 런타임 에러 뜸... 근데 C는 안해도 안 뜸...;;

func solution() {
    let input = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }
    let N = input[0]
    let K = input[1]
    var dp = Array(repeating: 0, count: K + 1)
    
    dp[0] = 1
    for _ in 0..<N {
        let val = Int(readLine()!)!
        if val <= K {
            for j in val...K {
                if dp[j - val] != 0 {
                    dp[j] = (dp[j] + dp[j - val]) % 2147483648
                }
            }
        }
    }
    
    print(dp[K])
}

solution()
