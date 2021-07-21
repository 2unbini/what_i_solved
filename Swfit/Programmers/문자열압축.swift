import Foundation

func solution(_ s: String) -> Int {
    var resultArr = [Int]()
    var cutNum = 0
    
    while cutNum <= s.count / 2 {
        var delNum = 0
        var dupCnt = 1
        var pre = ""
        var result = ""
        
        cutNum += 1
        while delNum <= s.count {
            let currentRemain = s.suffix(s.count - delNum)
            let currentPrefix = currentRemain.prefix(cutNum)
            
            if pre == currentPrefix {
                dupCnt += 1
                delNum += cutNum
                continue
            }
            
            if dupCnt > 1 {
                result += "\(dupCnt)\(pre)"
            } else {
                result += pre
            }
            pre = String(currentPrefix)
            dupCnt = 1
            delNum += cutNum
        }

        result += String(s.suffix(s.count - (delNum - cutNum)))
        resultArr.append(result.count)
    }
    
    resultArr = resultArr.sorted()
    return resultArr[0]
}
