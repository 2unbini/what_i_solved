// DP
// 시간초과 -> map에서 Int($0) 를 Int(String($0))으로 바꿔보자.

func solution() {
    let N = Int(readLine()!)!
    var T = [Int]()
    var P = [Int]()
    var dp = Array(repeating: 0, count: N + 1)
    
    for _ in 0..<N {
        let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
        T.append(input[0])
        P.append(input[1])
    }
    
    for i in 0..<N {
        
        if i + T[i] <= N {
            dp[i + T[i]] = max(dp[i + T[i]], dp[i] + P[i])
        }
        
        dp[i + 1] = max(dp[i + 1], dp[i])
    }
    
    print(dp.max()!)
}

solution()


// 더 컴팩트한 방법 -> T, P 배열 저장 안하고 풀기
func solution() {
    let N = Int(readLine()!)!
    var dp = Array(repeating: 0, count: N + 1)
    
    for _ in 0..<N {
        let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
        let T = input[0]
        let P = input[1]

				if i + T <= N {
					dp[i + T] = max(dp[i + T], dp[i] + T)
				}
				dp[i + 1] = max(dp[i + 1], dp[i])
    }

    print(dp.max()!)
}

solution()
