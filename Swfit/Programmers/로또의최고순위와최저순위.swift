import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var minRet = 0
    var maxRet = 0
    var usedWinNum = [Int]()
    var score = [6, 6, 5, 4, 3, 2, 1]
    
    for i in lottos {
        if i == 0 {
            maxRet += 1
            continue
        }
        for j in win_nums {
            if !usedWinNum.contains(j) && i == j {
                usedWinNum.append(j)
                minRet += 1
                maxRet += 1
            }
        }
    }
    
    return [score[maxRet], score[minRet]]
}
