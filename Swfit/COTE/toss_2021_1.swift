// No.1
import Foundation

func solution(_ stepCounts:[Int]) -> Int {
    var wholeCnt = 0
    var bonusPoint = 0
    var isBonusGiven = false
    var pointCnt = 0
    
    for (i, elem) in stepCounts.enumerated() {
        
        wholeCnt += (elem <= 10000) ? elem : 10000
        
        if elem >= 10000 {
            pointCnt += 1
            isBonusGiven = false
        }
        if isBonusGiven == false && (pointCnt == 1 || pointCnt == 3 || pointCnt == 5) {
            bonusPoint += 10000
            isBonusGiven = true
        }
        if (i + 1) % 7 == 0 {
            pointCnt = 0
        }
    }
    
    return wholeCnt + bonusPoint
}
