// DP

func solution() {
    let nmInput = readLine()!.split(separator: " ").compactMap { Int($0) }
    let N = nmInput[0]
    let M = nmInput[1]

    var candyNum = [[Int]]()
    for _ in 0..<N {
        let value = readLine()!.split(separator: " ").compactMap{ Int($0) }
        candyNum.append(value)
    }
    var maxNum = candyNum
    
    for i in stride(from: N - 1, through: 0, by: -1) {
        for j in stride(from: M - 1, through: 0, by: -1) {
            if i > 0 {
                maxNum[i - 1][j] = max(maxNum[i - 1][j], maxNum[i][j] + candyNum[i - 1][j])
            }
            if j > 0 {
                maxNum[i][j - 1] = max(maxNum[i][j - 1], maxNum[i][j] + candyNum[i][j - 1])
            }
        }
    }
    
    print(maxNum[0][0])
}

solution()
