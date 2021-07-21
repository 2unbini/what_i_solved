import Foundation

func solution(_ win_lose:[Int]) -> Int{
    var beforeWin = 0
    var winArr = [Int]()
    var answer = 0
    
    for i in win_lose {
        if i == 1 {
            if beforeWin == 1 {
                answer += 1
            } else {
                answer = 1
                beforeWin = 1
            }
        } else {
            if beforeWin == 1 {
                winArr.append(answer)
            }
            beforeWin = 0
            answer = 0
        }
    }
    if winArr.isEmpty == true {
            answer = 0
        } else {
            answer = winArr.max()!
        }
    
    return answer
}

print(solution([0, 0, 0, 0]))
