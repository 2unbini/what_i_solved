let computerCtn = Int(readLine()!)!
var cnt = Int(readLine()!)!
var computerArr = [[Int]]()
var checkedNum = Array(repeating: 0, count: computerCtn)

while cnt != 0 {
    let value = readLine()!.split(separator: " ").compactMap{ Int($0) }
    computerArr.append(value)
    cnt -= 1
}

func dfs(checkNum: Int) -> Int {
    var virusCnt = 0
    
    if checkedNum[checkNum - 1] == 0 {
        checkedNum[checkNum - 1] = 1
        virusCnt += 1
    } else {
        return virusCnt
    }
    
    for elem in computerArr {
        if elem[0] == checkNum {
            if (checkedNum[elem[1] - 1] == 1) {
                continue
            } else {
                virusCnt += dfs(checkNum: elem[1])
            }
        } else if elem[1] == checkNum {
            if (checkedNum[elem[0] - 1] == 1) {
                continue
            } else {
                virusCnt += dfs(checkNum: elem[0])
            }
        }
    }
    
    return virusCnt
}

print(dfs(checkNum: 1) - 1)
