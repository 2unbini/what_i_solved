// dfs

let N = Int(readLine()!)!
let numArr = readLine()!.split(separator: " ").compactMap { Int($0) }
var opArr = readLine()!.split(separator: " ").compactMap { Int($0) }
var maxVal = -1000000001
var minVal = 1000000001

func dfs(_ count: Int, _ sum: Int) {
    if count == N {
        maxVal = max(maxVal, sum)
        minVal = min(minVal, sum)
        return
    }
    
    for i in 0..<4 {
        if opArr[i] > 0 {
            opArr[i] -= 1
            switch i {
                case 0:
                    dfs(count + 1, sum + numArr[count])
                case 1:
                    dfs(count + 1, sum - numArr[count])
                case 2:
                    dfs(count + 1, sum * numArr[count])
                case 3:
                    dfs(count + 1, sum / numArr[count])
                default:
                    break
            }
            opArr[i] += 1
        }
    }
}

dfs(1, numArr[0])
print(maxVal)
print(minVal)
