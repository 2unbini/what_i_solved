import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failRateArr = [Double](repeating: 0, count: N)
    var i: Int = 1
    
    while i <= N {
        var clearPlayers: Double = 0
        var notClearPlayers: Double = 0
        
        for j in 0...(stages.count - 1) {
            if i < stages[j] {
                clearPlayers += 1
            } else if i == stages[j] {
                notClearPlayers += 1
            }
        }
        
        if (notClearPlayers == 0) {
            failRateArr[i - 1] = 0
            i += 1
            continue
        }
        let failRate = notClearPlayers / (notClearPlayers + clearPlayers)
        failRateArr[i - 1] = failRate
        i += 1
    }
    
    let failRateDesArr = failRateArr.sorted(by: >)
    var resultArr = [Int](repeating: 0, count: N)
    var usedArr = [Int](repeating: 0, count: N)
    
    for i in 0...(N - 1) {
        for j in 0...(N - 1) {
            if failRateDesArr[i] == failRateArr[j] && usedArr[j] == 0 {
                resultArr[i] = j + 1
                usedArr[j] = 1
                break
            }
        }
    }
    
    return resultArr
}
