// DP
// need to practice defining dp array and index

func solution() {
    let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
    let N = input[0]
    let K = input[1]
    var A = [Int]()
    var dp = Array(repeating: 100001, count: K + 1)

    for _ in 0..<N {
        let val = Int(readLine()!)!
        A.append(val)
    }
    
    dp[0] = 0
    
    for i in A {
        if i < K {
            for j in i...K {
                if dp[j - i] != 100001 {
                    dp[j] = min(dp[j], dp[j - i] + 1)
                }
            }
        }
    }
    
    if dp[K] == 100001 {
        print(-1)
    } else {
        print(dp[K])
    }
}

solution()
