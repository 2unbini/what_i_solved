// DP
// 주석 : 처음에 잘못 접근한 방식

func solution() {
    let N = Int(readLine()!)!
    var rgb = Array(repeating: Array(repeating: 0, count: 3), count: N + 1)
    
    for i in 1...N {
        rgb[i] = readLine()!.split(separator: " ").compactMap{ Int($0) }
    }
    
    if N > 1 {
        for i in 2...N {
            rgb[i][0] += min(rgb[i - 1][1], rgb[i - 1][2])
            rgb[i][1] += min(rgb[i - 1][0], rgb[i - 1][2])
            rgb[i][2] += min(rgb[i - 1][0], rgb[i - 1][1])
        }
    }
    
    print(rgb[N].min()!)
    
// 반례
// 2
// 101 100 101
// 100 1 100
// expect : 102
// my ret : 200

    /*
    if N > 1 {
        for i in 2...N {
            var minVal = 1001
            
            for j in 0...2 {
                if j != preIndex {
                    minVal = min(minVal, rgb[i][j])
                }
            }
            dp[i] = dp[i - 1] + minVal
            preIndex = rgb[i].firstIndex(of: minVal)!
        }
    }*/
    
}

solution()
