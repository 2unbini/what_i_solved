import Foundation

var madeTargetNumCnt = 0

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    dfs(numbers, 0, (numbers[0] * (-1)), target)
    dfs(numbers, 0, numbers[0], target)

    return madeTargetNumCnt
}

func dfs(_ numbers:[Int], _ i:Int, _ sum:Int, _ target:Int) {
    if i == numbers.count - 1 {
        if sum == target {
            madeTargetNumCnt += 1
        }
        return
    } else if i < numbers.count - 1 {
        dfs(numbers, i + 1, sum + (numbers[i + 1] * (-1)), target)
        dfs(numbers, i + 1, sum + numbers[i + 1], target)
    }
}
