import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    let movesCnt = moves.count
    let boardCnt = board.count
    var i = 0
    var deletedDolls = 0
    var dollArr: [Int] = []
    var usedArr = [[Int]](repeating: Array(repeating: 0, count: boardCnt), count: boardCnt)
    
    while i < movesCnt {
        let index = moves[i] - 1
        var j = 0
        for arr in board {
            j += 1
            if (arr[index] == 0 || usedArr[j - 1][index] == 1) {
                continue
            } else {
                dollArr.append(arr[index])
                usedArr[j - 1][index] = 1
                let dollCnt = dollArr.count
                if (dollCnt > 1 && dollArr[dollCnt - 2] == dollArr[dollCnt - 1]) {
                    dollArr.removeSubrange((dollCnt - 2)...(dollCnt - 1))
                    deletedDolls += 2
                }
                break
            }
        }
        i += 1
    }
    return deletedDolls
}
